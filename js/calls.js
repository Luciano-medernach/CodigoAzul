const containerUNA = document.getElementById("container-UNA");
const containerUA = document.getElementById("container-UA");
const containerNNA = document.getElementById("container-NNA");
const containerNA = document.getElementById("container-NA");

updateCalls();

setInterval(updateCalls, 5000);

function updateCalls() {
  // Crea la solicitud de AJAX
  let ajax_request = new XMLHttpRequest();

  let ajax_url = "/codigoazul/ajax-get-calls";

  ajax_request.onreadystatechange = function () {
    // Verifica que el estado sea correcto
    if (ajax_request.readyState == 4) {
      // Si la respuesta esta vacia entrega un mensaje
      if (ajax_request.responseText != "") {
        console.log(ajax_request);
        data = JSON.parse(ajax_request.responseText);

        data.forEach((element) => {
          let notUpload = false;

          let call = document.createElement("p");
          let attended = element.attended == 1 ? "Atendida" : "No atendida";
          call.textContent =
            element.type +
            " " +
            element.name +
            " " +
            element.origin +
            " " +
            element.date +
            " " +
            element.hour +
            " " +
            attended +
            " " +
            element.time;

          call.classList.add("js-generated");

          let nodes = document.getElementsByClassName("js-generated");

          Array.from(nodes).forEach((element) => {
            if (element.innerHTML === call.innerHTML) {
              notUpload = true;
            }
          });

          if (!notUpload) {
            if (element.type == "urgent") {
              if (element.attended) {
                containerUA.insertBefore(call, containerUA.firstChild);
              } else {
                containerUNA.insertBefore(call, containerUNA.firstChild);
              }
            } else {
              if (element.attended) {
                containerNA.insertBefore(call, containerNA.firstChild);
              } else {
                containerNNA.insertBefore(call, containerNNA.firstChild);
              }
            }
          }
        });
      }
    }
  };

  // Determina como se enviara la peticion
  ajax_request.open("GET", ajax_url);

  // Se envia la peticion
  ajax_request.send();
}
