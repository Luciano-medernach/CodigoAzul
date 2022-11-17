const nameSearchInput = document.getElementById("name-search");
const lastnameSearchInput = document.getElementById("lastname-search");

nameSearchInput.addEventListener("keyup", searchName);
lastnameSearchInput.addEventListener("keyup", searchLastname);

let nameCompatible = true;
let lastnameCompatible = true;

function searchName() {
  let nameSearchValue = nameSearchInput.value;

  let nameNodes = document.getElementsByClassName("name");

  Array.from(nameNodes).forEach((node) => {
    if (
      node.innerHTML.toLowerCase().includes(nameSearchValue.toLowerCase()) ||
      nameSearchValue.toLowerCase().includes(node.innerHTML.toLowerCase())
    ) {
      nameCompatible = true;
    } else {
      nameCompatible = false;
    }

    if (!nameCompatible || !lastnameCompatible) {
      node.parentElement.classList.add("hidden");
    } else {
      node.parentElement.classList.remove("hidden");
    }
  });
}

function searchLastname() {
  let lastnameSearchValue = lastnameSearchInput.value;

  let lastnameNodes = document.getElementsByClassName("lastname");

  Array.from(lastnameNodes).forEach((node) => {
    if (
      node.innerHTML
        .toLowerCase()
        .includes(lastnameSearchValue.toLowerCase()) ||
      lastnameSearchValue.toLowerCase().includes(node.innerHTML.toLowerCase())
    ) {
      lastnameCompatible = true;
    } else {
      lastnameCompatible = false;
    }

    if (!nameCompatible || !lastnameCompatible) {
      node.parentElement.classList.add("hidden");
    } else {
      node.parentElement.classList.remove("hidden");
    }
  });
}
