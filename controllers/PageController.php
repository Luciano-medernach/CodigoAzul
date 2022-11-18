<?php

include_once('views/PageView.php');
include_once('models/CallsModel.php');
include_once('models/PatientsModel.php');
include_once('models/AreasModel.php');
include_once('models/NursesModel.php');
include_once('models/UsersModel.php');

include_once('helpers/auth.helper.php');

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
        AuthHelper::checkLoggedIn();
        $averageTime = $this->callsModel->getAverageTime();

        $this->pageView->showHome($averageTime);
    }

    // Pantalla de error
    public function showError(){
        $this->pageView->showError();
    }

    // Muestra los reportes
    public function showReports(){
        AuthHelper::checkLoggedIn();

        $calls = $this->callsModel->getAll();
        $areas = $this->areasModel->getAll();

        $this->pageView->showReports();
    }


    // Ajax reportes
    public function createReport(){
        $filter = $_GET["filter"];

        $data = array();

        switch ($filter) {
            case 'area':
                $calls = $this->callsModel->getCountByArea();
                
                foreach ($calls as $call) {
                    array_push($data, array("y" => $call->count, "label" => $call->name));
                }
                break;
            case 'day':
                $calls = $this->callsModel->getCountByDate();
                
                foreach ($calls as $call) {
                    array_push($data, array("y" => $call->count, "label" => $call->date));
                }
                break;
            case 'hour':
                $calls = $this->callsModel->getCountByHour();
                
                foreach ($calls as $call) {
                    array_push($data, array("y" => $call->count, "label" => $call->hour));
                }
                break;
            case 'origin':
                $calls = $this->callsModel->getCountByOrigin();
                
                foreach ($calls as $call) {
                    array_push($data, array("y" => $call->count, "label" => $call->origin));
                }
                break;

            default:
                # code...
                break;
        }

        
        
        

        echo json_encode($data, JSON_NUMERIC_CHECK);

    }

}