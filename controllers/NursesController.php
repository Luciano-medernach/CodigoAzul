<?php

include_once('views/NursesView.php');
include_once('models/NursesModel.php');
include_once('models/AreasModel.php');
include_once('models/PatientsModel.php');

include_once('helpers/auth.helper.php');


class NursesController{

    public function __construct(){
        $this->nursesView = new NursesView();
        $this->nursesModel = new NursesModel();
        $this->areasModel = new AreasModel();
        $this->patientsModel = new PatientsModel();
    }

    // Muestra el listado de enfermeros
    public function showList(){
        AuthHelper::checkLoggedIn();

        $page = $_GET["page"];
        $name = $_GET["name"];
        
        if($name != ""){
            $count = $this->nursesModel->getCountByName($name);
            $nurses = $this->nursesModel->getByName($name, $page);
        } else {
            $count = $this->nursesModel->getCount();
            $nurses = $this->nursesModel->getAllByPage($page);
        }
        
        $this->nursesView->showList($nurses, floor($count->count/50), $name);
    }

    // Muestra un enfermero
    public function show(){
        AuthHelper::checkLoggedIn();

        $id = $_GET["id"];
        $nurse = $this->nursesModel->getById($id);
        $areas = $this->areasModel->getAll();
        $assignedAreas = $this->nursesModel->getAreasAssigned($id);
        $patients = $this->patientsModel->getAll();
        $assignedPatients = $this->nursesModel->getPatientsAssigned($id);
        $this->nursesView->show($nurse, $areas, $assignedAreas, $patients, $assignedPatients);
    }

    // Muestra el formulario de adicion de enfermeros
    public function showAdd(){
        AuthHelper::checkLoggedIn();

        $this->nursesView->showAdd();
    }

    // Muestra el formulario de adicion de enfermeros
    public function showEdit(){
        AuthHelper::checkLoggedIn();

        $id = $_GET["id"];
        $nurse = $this->nursesModel->getById($id);
        $this->nursesView->showEdit($nurse);
    }


    // * DB FUNCTIONS

    // Agrega un enfermero
    public function add(){
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];

        $this->nursesModel->add($name, $lastname);
        header("Location: " . $BASE_URL . "nurses?page=0&name=");
    }

    // Edita un enfermero
    public function edit(){
        $id = $_POST["id"];
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];

        $this->nursesModel->edit($id, $name, $lastname);
        header("Location: " . $BASE_URL . "nurses?page=0&name=");
    }

    // Elimina un enfermero
    public function delete(){
        $id = $_POST["id"];

        $this->nursesModel->delete($id);
        header("Location: " . $BASE_URL . "nurses?page=0&name=");

    }

}