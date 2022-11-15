<?php

include_once('views/PatientsView.php');
include_once('models/PatientsModel.php');
include_once('models/AreasModel.php');
include_once('models/NursesModel.php');

class PatientsController{

    public function __construct(){
        $this->patientsView = new PatientsView();
        $this->patientsModel = new PatientsModel();
        $this->nursesModel = new NursesModel();
        $this->areasModel = new AreasModel();
    }

    // Muestra el listado de pacientes
    public function showList(){
        $patients = $this->patientsModel->getAll();
        $this->patientsView->showList($patients);
    }

    // Muestra el paciente
    public function show(){
        $id = $_GET["id"];
        $patient = $this->patientsModel->getById($id);
        $nurses = $this->nursesModel->getAll();
        $assignedNurses = $this->nursesModel->getAssignedToPatient($id);
        $this->patientsView->show($patient, $nurses, $assignedNurses);
    }


    // Muestra el formulario de adicion de pacientes
    public function showAdd(){
        $areas = $this->areasModel->getAll();
        $nurses = $this->nursesModel->getAll();
        $this->patientsView->showAdd($areas, $nurses);
    }

    // Muestra el formulario de edicion de pacientes
    public function showEdit(){
        $id = $_GET["id"];
        $areas = $this->areasModel->getAll();
        $nurses = $this->nursesModel->getAll();
        $user = $this->patientsModel->getById($id);
        $this->patientsView->showEdit($user, $areas, $nurses);
    }


    // * DB FUNCTIONS

    // Agrega un paciente
    public function add(){
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $dni = $_POST["dni"];
        $age = $_POST["age"];
        $address = $_POST["address"];
        $phone = $_POST["phone"];
        $family_phone = $_POST["family_phone"];
        $height = $_POST["height"];
        $weight = $_POST["weight"];
        $medical_history = $_POST["medical_history"];
        $medicines = $_POST["medicines"];
        $area = $_POST["area"];
        $nurseid = $_POST["nurse"];

        $this->patientsModel->add($name, $lastname, $dni, $age, $address, $phone, $family_phone, $height, $weight, $medical_history, $medicines, $area);

        $patientid = $this->patientsModel->getLastInserted();
        var_dump($patientid);

        $this->nursesModel->assignToPatient($nurseid, $patientid);

        header("Location: " . $BASE_URL . "patients");
    }

    // Edita un paciente
    public function edit(){
        $id = $_POST["id"];

        $patient = $this->patientsModel->getById($id);

        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $dni = $_POST["dni"];
        $age = $_POST["age"];
        $address = $_POST["address"];
        $phone = $_POST["phone"];
        $family_phone = $_POST["family_phone"];
        $height = $_POST["height"];
        $weight = $_POST["weight"];
        $medical_history = $_POST["medical_history"];
        $medicines = $_POST["medicines"];
        $area = $_POST["area"];

        $area = $area == "none" ? $patient->area : $area;
        $nurse = $nurse == "none" ? $patient->nurse : $nurse;

        $this->patientsModel->edit($id, $name, $lastname, $dni, $age, $address, $phone, $family_phone, $height, $weight, $medical_history, $medicines, $area);
        header("Location: " . $BASE_URL . "patients");
    }

    // Elimina un paciente
    public function delete(){
        $id = $_POST["id"];

        $this->patientsModel->delete($id);
        header("Location: " . $BASE_URL . "patients");
    }

}