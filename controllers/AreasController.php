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


    // * DB FUNCTIONS

    // Agrega un area
    public function add(){
        $name = $_POST["name"];

        $this->areasModel->add($name);
        header("Location: " . $BASE_URL . "areas");
    }

    // Edita un area
    public function edit(){
        $id = $_POST["id"];
        $name = $_POST["name"];

        $this->areasModel->edit($id, $name);
        header("Location: " . $BASE_URL . "areas");
    }

    // Elimina un area
    public function delete(){
        $id = $_POST["id"];

        if($this->areasModel->checkPatients($id) > 0){
            echo '<script language="javascript">';
            echo 'alert("¡Todavia existen pacientes en esta area!");';
            echo 'history.back()';
            echo '</script>'; 
        }


        $this->areasModel->delete($id);
        


    }

}
