<?php

include_once('views/PatientsView.php');
include_once('models/PatientsModel.php');

class UsersController{

    public function __construct(){
        $this->patientsView = new PatientsView();
        $this->patientsModel = new PatientsModel();
    }

    // Muestra el listado de usuarios
    public function showList(){
        $patients = $this->patientsModel->getAll();
        $this->patientsView->showList($patients);
    }

    // Muestra el formulario de adicion de usuario
    public function showAdd(){
        $this->patientsView->showAdd();
    }

    // Muestra el formulario de adicion de usuario
    public function showEdit(){
        $id = $_POST["id"];
        $user = $this->getById($id);
        $this->patientsView->showEdit($user);
    }


    // * DB FUNCTIONS

    // Agrega un usuario
    public function add(){
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        $admin = $_POST["admin"];

        $this->patientsModel->add($name, $lastname, $username, $password, $admin);
        header("Location: " . $BASE_URL . "home");
    }

    // Edita un usuario
    public function edit(){
        $id = $_POST["id"];
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        $admin = $_POST["admin"];

        $this->patientsModel->edit($id, $name, $lastname, $username, $password, $admin);
        header("Location: " . $BASE_URL . "home");
    }

    // Elimina un usuario
    public function delete(){
        $id = $_POST["id"];

        $this->patientsModel->delete($id);
        header("Location: " . $BASE_URL . "home");
    }

}