<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class NursesView extends Viewer {

        public function __construct() {
            parent::__construct();
            $id = AuthHelper::getLoggedUserId();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $this->getSmarty()->assign('id', $id);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('admin', $admin);
        }

        // Muestra el listado de enfermeros
        function showList($nurses, $count, $name){
            $this->getSmarty()->assign('nurses', $nurses);
            $this->getSmarty()->assign('count', $count);
            $this->getSmarty()->assign('name', $name);
            $this->getSmarty()->display('templates/nurses/nurses.tpl');
        }

        // Muestra un enfermero
        function show($nurse, $areas, $assignedAreas, $patients, $assignedPatients){
            $this->getSmarty()->assign('nurse', $nurse);
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->assign('assignedAreas', $assignedAreas);
            $this->getSmarty()->assign('patients', $patients);
            $this->getSmarty()->assign('assignedPatients', $assignedPatients);
            $this->getSmarty()->display('templates/nurses/nurse.tpl');
        }

        // Muestra el formulario de adicion de enfermeros
        function showAdd(){
            $this->getSmarty()->display('templates/nurses/nurse-add.tpl');
        }

        // Muestra el formulario de adicion de enfermeros
        function showEdit($nurse){
            $this->getSmarty()->assign('nurse', $nurse);
            $this->getSmarty()->display('templates/nurses/nurse-edit.tpl');
        }

    }
?>