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
