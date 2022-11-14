<?php

include_once('views/AreasView.php');
include_once('models/AreasModel.php');

class AreasController{

    public function __construct(){
        $this->areasView = new AreasView();
        $this->areasModel = new AreasModel();
    }

    // Muestra el listado de areas
    public function showList(){
        $areas = $this->areasModel->getAll();
        $this->areasView->showList($areas);
    }

    // Muestra el formulario de adicion de areas
    public function showAdd(){
        $this->areasView->showAdd();
    }

    // Muestra el formulario de adicion de areas
    public function showEdit(){
        $id = $_POST[$id];
        $area = $this->areasModel->getById($id);
        $this->areasView->showEdit($area);
    }


    // * DB FUNCTIONS

    // Agrega un area
    public function add(){
        $title = $_POST["title"];

        $this->areasModel->add($title);
        header("Location: " . $BASE_URL . "areas");
    }

    // Edita un area
    public function edit(){
        $id = $_POST["id"];
        $title = $_POST["title"];

        $this->areasModel->edit($id, $title);
        header("Location: " . $BASE_URL . "home");
    }

    // Elimina un area
    public function delete(){
        $id = $_POST["id"];

        $this->areasModel->delete($id);
        header("Location: " . $BASE_URL . "areas");
    }

}