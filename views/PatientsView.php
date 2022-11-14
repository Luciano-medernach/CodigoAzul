<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class PatientsView extends Viewer {

        public function __construct() {
            parent::__construct();
        }

        // Muestra el listado de pacientes
        function showList($patients){
            $this->getSmarty()->assign('patients', $patients);
            $this->getSmarty()->display('templates/patients.tpl');
        }

        // Muestra el formulario de adicion de pacientes
        function showAdd(){
            $this->getSmarty()->display('templates/patientsAdd.tpl');
        }

        // Muestra el formulario de adicion de pacientes
        function showEdit($patient){
            $this->getSmarty()->assign('patient', $patients);
            $this->getSmarty()->display('templates/patientsEdit.tpl');
        }

    }
?>