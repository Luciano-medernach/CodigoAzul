<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class UsersView extends Viewer {

        public function __construct() {
            parent::__construct();
        }

        // Muestra el listado de usuarios
        function showList($users){
            $this->getSmarty()->assign('users', $users);
            $this->getSmarty()->display('templates/users.tpl');
        }

        // Muestra el formulario de adicion de usuarios
        function showAdd(){
            $this->getSmarty()->display('templates/usersAdd.tpl');
        }

        // Muestra el formulario de adicion de usuarios
        function showEdit($user){
            $this->getSmarty()->assign('user', $user);
            $this->getSmarty()->display('templates/usersEdit.tpl');
        }

    }
?>