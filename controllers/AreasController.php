<?php

include_once('views/AreasView.php');
include_once('models/AreasModel.php');
include_once('models/NursesModel.php');
include_once('models/PatientsModel.php');

class AreasController{

    public function __construct(){
        $this->areasView = new AreasView();
        $this->areasModel = new AreasModel();
        $this->nursesModel = new NursesModel();
        $this->patientsModel = new PatientsModel();
    }

    // Muestra el listado de areas
    public function showList(){
        $areas = $this->areasModel->getAll();
        $this->areasView->showList($areas);
    }

    // Muestra el area
    public function show(){
        $id = $_GET["id"];
        $area = $this->areasModel->getById($id);
        $patients = $this->patientsModel->getAll($id);
        $assignedPatients = $this->patientsModel->getAssignedToArea($id);
        $nurses = $this->nursesModel->getAll($id);
        $assignedNurses = $this->nursesModel->getAssignedToArea($id);
        $assignedOrigins = $this->areasModel->getOriginsAssigned($id);
        $this->areasView->show($area, $patients, $assignedPatients, $nurses, $assignedNurses, $assignedOrigins);
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

    // Asigna un paciente al area
    public function assignPatient(){
        $patientid = $_POST["patientid"];
        $areaid = $_POST["areaid"];

        if($this->patientsModel->checkAssignedArea($patientid, $areaid) > 0){
            echo '<script language="javascript">';
            echo 'alert("Ya se encuentra asignado.");';
            echo 'history.back();';
            echo '</script>'; 
        } else {
            $this->patientsModel->assignToArea($patientid, $areaid);
            echo '<script language="javascript">';
            echo 'history.back()';
            echo '</script>'; 
        };

    }

    // Desasigna un paciente del area
    public function deassignPatient(){
        $patientid = $_POST["patientid"];
        $areaid = $_POST["areaid"];

        $this->patientsModel->deassignToArea($patientid, $areaid);
        echo '<script language="javascript">';
        echo 'history.back()';
        echo '</script>'; 
    }

    // Asigna un enfermero al area
    public function assignNurse(){
        $nurseid = $_POST["nurseid"];
        $areaid = $_POST["areaid"];

        if($this->nursesModel->checkAssignedArea($nurseid, $areaid) > 0){
            echo '<script language="javascript">';
            echo 'alert("Ya se encuentra asignado.");';
            echo 'history.back();';
            echo '</script>'; 
        } else {
            $this->nursesModel->assignToArea($nurseid, $areaid);
            echo '<script language="javascript">';
            echo 'history.back()';
            echo '</script>'; 
        };
    }

    // Desasigna un enfermero del area
    public function deassignNurse(){
        $nurseid = $_POST["nurseid"];
        $areaid = $_POST["areaid"];

        $this->nursesModel->deassignToArea($nurseid, $areaid);
        echo '<script language="javascript">';
        echo 'history.back()';
        echo '</script>'; 
    }

    // Asigna un origen de llamada al area
    public function assignOrigin(){
        $origin = $_POST["origin"];
        $areaid = $_POST["areaid"];

        if($this->areasModel->checkAssignedOrigin($origin, $areaid) > 0){
            echo '<script language="javascript">';
            echo 'alert("Ya se encuentra asignado.");';
            echo 'history.back();';
            echo '</script>'; 
        } else {
            $this->areasModel->assignToArea($origin, $areaid);
            echo '<script language="javascript">';
            echo 'history.back()';
            echo '</script>'; 
        };
    }

    // Desasigna un origen de llamada del area
    public function deassignOrigin(){
        $origin = $_POST["origin"];
        $areaid = $_POST["areaid"];

        $this->areasModel->deassignToArea($origin, $areaid);
        echo '<script language="javascript">';
        echo 'history.back()';
        echo '</script>'; 
    }

}
