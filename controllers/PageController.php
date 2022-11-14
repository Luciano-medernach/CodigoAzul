<?php

include_once('views/PageView.php');
include_once('models/SportsModel.php');
include_once('models/TournamentsModel.php');
include_once('models/TeamsModel.php');
include_once('models/UsersModel.php');

class PageController{
    private $pageView;
    private $sportsModel;
    private $tournamentsModel;
    private $usersModel;
    private $teamsModel;

    public function __construct(){
        $this->pageView = new PageView();
        $this->sportsModel = new SportsModel();
        $this->tournamentsModel = new TournamentsModel();
        $this->usersModel = new UsersModel();
        $this->teamsModel = new TeamsModel();
    }

     // Muestra el inicio
     public function showHome(){
        $this->pageView->showHome();
    }

    // Muestra el perfil
    public function showCalendar(){
        $sports = $this->sportsModel->getAll();
        $this->pageView->showCalendar($sports);
    }

    // Muestra la busqueda
    public function showSearch(){
        $name = $_GET["search"];
        $type = $_GET["type"];
        switch($type){
            case "Torneos":
                $tournaments = $this->tournamentsModel->getByName($name);
                $this->pageView->showSearchTournaments($tournaments);
                break;

            case "Equipos":
                $teams = $this->teamsModel->getByName($name);
                $this->pageView->showSearchTeams($teams);
                break;

            case "Usuarios":
                $users = $this->usersModel->getByName($name);
                $this->pageView->showSearchUsers($users);
                break;
        }

        
    }

    public function showPlans(){
        $this->pageView->showPlans();
    }

    // Muestra el panel de administrador
    public function showAdmin(){
        $this->pageView->showAdmin();
    }

    // Muestra la administracion de usuarios
    public function showAdminUsers(){
        $users = $this->usersModel->getAll();
        $this->pageView->showAdminUsers($users);
    }

    // Muestra la administracion de usuarios
    public function showAdminTournaments(){
        $tournaments = $this->tournamentsModel->getAll();
        $this->pageView->showAdminTournaments($tournaments);
    }

    // Muestra la administracion de usuarios
    public function showAdminSports(){
        $sports = $this->sportsModel->getAll();
        $this->pageView->showAdminSports($sports);
    }

    // TESTEO
    public function showMP(){
        $this->pageView->showMP();
    }
}