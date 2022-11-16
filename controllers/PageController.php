<?php

include_once('views/PageView.php');
include_once('models/CallsModel.php');
include_once('models/PatientsModel.php');
include_once('models/AreasModel.php');
include_once('models/NursesModel.php');
include_once('models/UsersModel.php');

class PageController{

    public function __construct(){
        $this->pageView = new PageView();
        $this->callsModel = new CallsModel();
        $this->patientsModel = new PatientsModel();
        $this->areasModel = new AreasModel();
        $this->nursesModel = new NursesModel();
        $this->usersModel = new UsersModel();
    }

    // Muestra el inicio
    public function showHome(){
        $calls = $this->callsModel->getByType("urgents");
        $patients = $this->patientsModel->getLast();
        $nurses = $this->nursesModel->getLast();
        $areas = $this->areasModel->getLast();
        $users = $this->usersModel->getLast();
        $this->pageView->showHome($calls, $patients, $nurses, $areas, $users);
    }

    // Pantalla de error
    public function showError(){
        $this->pageView->showError();
    }

    // Muestra los reportes
    public function showReports(){
        $calls = $this->callsModel->getAll();
        $areas = $this->areasModel->getAll();

        $this->pageView->showReports();
    }


    // Ajax reportes
    public function createReport(){
        $calls = $this->callsModel->getCountByDate();
        $data = array();
        
        foreach ($calls as $call) {
            array_push($data, array("y" => $call->count, "label" => $call->date));
        }

        echo json_encode($data, JSON_NUMERIC_CHECK);

    }

}