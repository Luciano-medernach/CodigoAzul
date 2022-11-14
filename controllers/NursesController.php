<?php

include_once('views/NursesView.php');
include_once('models/NursesModel.php');

class NursesController{

    public function __construct(){
        $this->nursesView = new NursesView();
        $this->nursesModel = new NursesModel();
    }

    // Muestra el listado de enfermeros
    public function showList(){
        $nurses = $this->nursesModel->getAll();
        $this->nursesView->showList($nurses);
    }

    // Muestra el formulario de adicion de enfermeros
    public function showAdd(){
        $this->nursesView->showAdd();
    }

    // Muestra el formulario de adicion de enfermeros
    public function showEdit(){
        $id = $_POST[$id];
        $nurse = $this->nursesModel->getById($id);
        $this->nursesView->showEdit($nurse);
    }


    // * DB FUNCTIONS

    // Agrega un enfermero
    public function add(){
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];

        $this->nursesModel->add($name, $lastname);
        header("Location: " . $BASE_URL . "home");
    }

    // Edita un enfermero
    public function edit(){
        $id = $_POST["id"];
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];

        $this->nursesModel->edit($id, $name, $lastname);
        header("Location: " . $BASE_URL . "home");
    }

    // Elimina un enfermero
    public function delete(){
        $id = $_POST["id"];

        $this->nursesModel->delete($id);
        header("Location: " . $BASE_URL . "home");
    }

}