<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class CallsView extends Viewer {

        public function __construct() {
            parent::__construct();
            $id = AuthHelper::getLoggedUserId();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $this->getSmarty()->assign('id', $id);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('admin', $admin);
        }

        // Muestra el listado de llamadas
        function showList($calls){
            $this->getSmarty()->assign('calls', $calls);
            $this->getSmarty()->display('templates/calls.tpl');
        }

    }
?>