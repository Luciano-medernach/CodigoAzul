<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class PatientsView extends Viewer {

        public function __construct() {
            parent::__construct();
            $id = AuthHelper::getLoggedUserId();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $this->getSmarty()->assign('id', $id);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('admin', $admin);
        }

        // Muestra el listado de pacientes
        function showList($patients){
            $this->getSmarty()->assign('patients', $patients);
            $this->getSmarty()->display('templates/patients/patients.tpl');
        }

        // Muestra el paciente
        function show($patient, $nurses, $assignedNurses){
            $this->getSmarty()->assign('patient', $patient);
            $this->getSmarty()->assign('nurses', $nurses);
            $this->getSmarty()->assign('assignedNurses', $assignedNurses);
            $this->getSmarty()->display('templates/patients/patient.tpl');
        }

        // Muestra el formulario de adicion de pacientes
        function showAdd($areas, $nurses){
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->assign('nurses', $nurses);
            $this->getSmarty()->display('templates/patients/patient-add.tpl');
        }

        // Muestra el formulario de adicion de pacientes
        function showEdit($patient, $areas, $nurses){
            $this->getSmarty()->assign('areas', $areas);
            $this->getSmarty()->assign('nurses', $nurses);
            $this->getSmarty()->assign('patient', $patient);
            $this->getSmarty()->display('templates/patients/patient-edit.tpl');
        }

    }
?>