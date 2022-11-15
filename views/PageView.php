<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class PageView extends Viewer {

        public function __construct() {
            parent::__construct();
            $id = AuthHelper::getLoggedUserId();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $this->getSmarty()->assign('id', $id);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('admin', $admin);
        }

        // Muestra el inicio de la pagina
        function showHome($calls, $patients, $nurses, $areas, $users){
            $this->getSmarty()->assign('calls', $calls);
            $this->getSmarty()->assign('patients', $patients);
            $this->getSmarty()->assign('nurses', $nurses);
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->assign('users', $users);
            $this->getSmarty()->display('templates/home.tpl');
        }

        // Pantalla de error
        function showError(){
            $this->getSmarty()->display('templates/error.tpl');
        }

    }
?>