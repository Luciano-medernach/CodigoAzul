const areaContainer = document.getElementById("area-container");

function edit(id) {
  const originalButton = document.getElementById("button-" + id);

  const nameP = document.getElementById("area-" + id);

  const form = document.createElement("form");
  form.action = "db-area-edit";
  form.method = "POST";

  const nameInput = document.createElement("input");
  nameInput.value = nameP.textContent;
  nameInput.type = "text";
  nameInput.name = "name";

  const button = document.createElement("button");
  button.textContent = "Editar";

  const hiddenInput = document.createElement("input");
  hiddenInput.type = "hidden";
  hiddenInput.value = id;
  hiddenInput.name = "id";

  form.append(nameInput, hiddenInput, button);

  areaContainer.replaceChild(form, nameP);
  areaContainer.removeChild(originalButton);
}
