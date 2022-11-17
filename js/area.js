const areaContainer = document.getElementById("area-container");
const subContainer = document.getElementById("sub-area-container");

const nameSearchInput = document.getElementById("name-search");

nameSearchInput.addEventListener("keyup", searchName);

function searchName() {
  let nameSearchValue = nameSearchInput.value;

  let nameNodes = document.getElementsByClassName("name");

  Array.from(nameNodes).forEach((node) => {
    if (
      node.innerHTML.toLowerCase().includes(nameSearchValue.toLowerCase()) ||
      nameSearchValue.toLowerCase().includes(node.innerHTML.toLowerCase())
    ) {
      node.parentElement.classList.remove("hidden");
    } else {
      node.parentElement.classList.add("hidden");
    }
  });
}

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
  subContainer.removeChild(originalButton);
}
