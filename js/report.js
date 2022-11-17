const chartContainer = document.getElementById("chartContainer");
const dataFilter = document.getElementById("data-filter");
const typeFilter = document.getElementById("type-filter");

let title;

updateReport();

dataFilter.addEventListener("change", updateReport);
typeFilter.addEventListener("change", updateReport);

function updateReport() {
  switch (dataFilter.value) {
    case "area":
      title = "Llamadas por area.";
      break;

    case "day":
      title = "Llamadas por dia de la ultima semana.";
      break;

    case "hour":
      title = "Llamadas por hora.";
      break;

    case "origin":
      title = "Llamadas por origen.";
      break;

    default:
      break;
  }

  // Crea la solicitud de AJAX
  let ajax_request = new XMLHttpRequest();

  let ajax_url = "/codigoazul/ajax-report?filter=" + dataFilter.value;

  ajax_request.onreadystatechange = function () {
    // Verifica que el estado sea correcto
    if (ajax_request.readyState == 4) {
      // Si la respuesta esta vacia entrega un mensaje
      if (ajax_request.responseText != "") {
        console.log(ajax_request);
        data = JSON.parse(ajax_request.responseText);

        // Convierte la respuesta a un JSON
        var chart = new CanvasJS.Chart("chart", {
          animationEnabled: true,
          title: {
            text: title,
          },

          exportEnabled: true,
          theme: "light1", // "light1", "light2", "dark1", "dark2"
          axisY: {
            includeZero: true,
          },
          data: [
            {
              type: typeFilter.value, //change type to bar, line, area, pie, etc
              //indexLabel: "{y}", //Shows y value on all Data Points
              indexLabelFontColor: "#5A5757",
              indexLabelPlacement: "outside",
              dataPoints: data,
            },
          ],
        });
        chart.render();

        // Crea un boton y le asigna la funcion de descargar el pdf.
        const button = document.createElement("button");

        button.textContent = "Exportar como PDF";
        button.id = "exportButton";

        let dataurl = document
          .getElementById("chartContainer")
          .getElementsByClassName("canvasjs-chart-canvas")[0];

        button.addEventListener("click", () => {
          var pdf = new jspdf.jsPDF({
            orientation: "landscape",
          });
          pdf.addImage(dataurl, "JPEG", 0, 0);
          pdf.save("report.pdf");
        });

        chartContainer.removeChild(chartContainer.lastChild);
        chartContainer.append(button);
      }
    }
  };

  // Determina como se enviara la peticion
  ajax_request.open("GET", ajax_url);

  // Se envia la peticion
  ajax_request.send();
}
