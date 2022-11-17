const addForm = document.getElementById("add-form");
const unknownContainer = document.getElementById("unknown-container");
const unknownCheck = document.getElementById("unknown-check");
const spaces = document.getElementsByClassName("space");

unknownCheck.addEventListener("change", unknown);

let nodes = document.getElementsByClassName("removable");

function unknown() {
  if (unknownCheck.checked) {
    Array.from(nodes).forEach((node) => {
      node.classList.add("hidden");
      node.removeAttribute("required");
    });

    Array.from(spaces).forEach((space) => {
      space.classList.remove("hidden");
    });

    addForm.action = "db-patient-add-unknown";
  } else {
    Array.from(nodes).forEach((node) => {
      node.classList.remove("hidden");
      node.setAttribute("required", "");
    });

    Array.from(spaces).forEach((space) => {
      space.classList.add("hidden");
    });

    addForm.action = "db-patient-add";
  }
}
