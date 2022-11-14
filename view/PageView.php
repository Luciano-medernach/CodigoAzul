<?php
    require_once('Viewer.php');
    require_once('helpers/auth.helper.php');

    class PageView extends Viewer {

        public function __construct() {
            parent::__construct();
            $username = AuthHelper::getLoggedUserName();
            $admin = AuthHelper::adminStatus();
            $id = AuthHelper::getLoggedUserId();
            $organizer = AuthHelper::organizerStatus();
            $this->getSmarty()->assign('admin',$admin);
            $this->getSmarty()->assign('username', $username);
            $this->getSmarty()->assign('userId', $id);
            $this->getSmarty()->assign('organizer', $organizer);
        }

        // Muestra el inicio de la pagina
        function showHome(){
            $this->getSmarty()->display('templates/Home.tpl');
        }

        // Muestra el calendario con los eventos
        function showCalendar($sports){
            $this->getSmarty()->assign("sports", $sports);
            $this->getSmarty()->display('templates/Calendar.tpl');
        }

        // Muestra la busqueda de torneos
        function showSearchTournaments($tournaments){
            $this->getSmarty()->assign("tournaments", $tournaments);
            $this->getSmarty()->display('templates/SearchTournaments.tpl');
        }

        // Muestra la busqueda de equipos
        function showSearchTeams($teams){
            $this->getSmarty()->assign("teams", $teams);
            $this->getSmarty()->display('templates/SearchTeams.tpl');
        }

        // Muestra la busqueda de usuarios
        function showSearchUsers($users){
            $this->getSmarty()->assign("users", $users);
            $this->getSmarty()->display('templates/SearchUsers.tpl');
        }

        // Muestra los planes de suscripcion
        function showPlans(){
            AuthHelper::checkLoggedIn();
            $this->getSmarty()->display('templates/plans.tpl');
        }

        // Admin Interactions
        // Muestra el panel de administracion
        function showAdmin(){
            $this->getSmarty()->display('templates/admin/Admin.tpl');
        }

        // TESTEO 
        function showMP(){
            $this->getSmarty()->display("templates/admin/mercado-pago.tpl");
        }
    }
?>