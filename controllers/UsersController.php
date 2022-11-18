<?php

include_once('views/UsersView.php');
include_once('models/UsersModel.php');
include_once('helpers/auth.helper.php');

include_once('helpers/auth.helper.php');


class UsersController{

    public function __construct(){
        $this->usersView = new UsersView();
        $this->usersModel = new UsersModel();
    }

    // Muestra el listado de usuarios
    public function showList(){
        AuthHelper::checkLoggedIn();

        $page = $_GET["page"];
        $name = $_GET["name"];
        
        if($name != ""){
            $count = $this->usersModel->getCountByName($name);
            $users = $this->usersModel->getByName($name, $page);
        } else {
            $count = $this->usersModel->getCount();
            $users = $this->usersModel->getAllByPage($page);
        }
        
        $this->usersView->showList($users, floor($count->count/50), $name);

    }

    // Muestra el formulario de ingreso
    public function showSignin(){

        $this->usersView->showSignin();
    }

    // Muestra el formulario de adicion de usuario
    public function showAdd(){
        AuthHelper::checkLoggedIn();

        $this->usersView->showAdd();
    }

    // Muestra el formulario de adicion de usuario
    public function showEdit(){
        AuthHelper::checkLoggedIn();

        $id = $_GET["id"];
        $user = $this->usersModel->getById($id);
        $this->usersView->showEdit($user);
    }


    // * DB FUNCTIONS

    // Inicia sesion
    public function signin(){
        $username = $_POST["user"];
        $password = $_POST["password"];
        $password = md5($password);

        $user = $this->usersModel->getByUsername($username);

        if($user){
            if($password == $user->password){
                AuthHelper::login($user);
                header("Location: " . $BASE_URL . "home");
            } else {
                $this->usersView->showSignin("Contraseña incorrecta.");
            }
        } else {
            $this->usersView->showSignin("Nombre de usuario incorrecto.");
        }
    }

    // Agrega un usuario
    public function add(){
        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        $admin = isset($_POST["admin"]) ? 1 : 0;

        $this->usersModel->add($name, $lastname, $username, $password, $admin);
        header("Location: " . $BASE_URL . "users");
    }

    // Edita un usuario
    public function edit(){
        $id = $_POST["id"];

        $user = $this->usersModel->getById($id);

        $name = $_POST["name"];
        $lastname = $_POST["lastname"];
        $username = $_POST["username"];
        $password = $_POST["password"];
        
        if($password != $user->password){
            $password = md5($password);
        }

        $admin = isset($_POST["admin"]) ? 1 : 0;

        var_dump($admin);

        $this->usersModel->edit($id, $name, $lastname, $username, $password, $admin);
        header("Location: " . $BASE_URL . "users");
    }

    // Elimina un usuario
    public function delete(){
        $id = $_POST["id"];

        $this->usersModel->delete($id);
        header("Location: " . $BASE_URL . "users");
    }

    // Desloguea un usuario
    public function logout(){
        AuthHelper::logout();
        header("Location: " . $BASE_URL . "home");

    }

}