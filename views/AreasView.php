<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class AreasView extends Viewer {

        public function __construct() {
            parent::__construct();
            $id = AuthHelper::getLoggedUserId();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $this->getSmarty()->assign('id', $id);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('admin', $admin);
        }

        // Muestra el listado de areas
        function showList($areas){
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->display('templates/areas/areas.tpl');
        }

        // Muestra el formulario de adicion de areas
        function showAdd(){
            $this->getSmarty()->display('templates/areas/areasAdd.tpl');
        }

        // Muestra el formulario de adicion de areas
        function showEdit($areas){
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->display('templates/areas/areasEdit.tpl');
        }

    }
?>