<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class UsersView extends Viewer {

        public function __construct() {
            parent::__construct();
            $id = AuthHelper::getLoggedUserId();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $this->getSmarty()->assign('id', $id);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('admin', $admin);
        }

        // Muestra el listado de usuarios
        function showList($users, $count, $name){
            $this->getSmarty()->assign('users', $users);
            $this->getSmarty()->assign('count', $count);
            $this->getSmarty()->assign('name', $name);
            $this->getSmarty()->display('templates/users/users.tpl');
        }

        // Muestra el formulario de ingreso
        function showSignin($error = null){
            $this->getSmarty()->assign('error', $error);
            $this->getSmarty()->display('templates/users/signin.tpl');
        }

        // Muestra el formulario de adicion de usuarios
        function showAdd(){
            $this->getSmarty()->display('templates/users/user-add.tpl');
        }

        // Muestra el formulario de adicion de usuarios
        function showEdit($user){
            $this->getSmarty()->assign('user', $user);
            $this->getSmarty()->display('templates/users/user-edit.tpl');
        }

    }
?>