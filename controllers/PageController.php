<?php

include_once('views/PageView.php');
include_once('models/CallsModel.php');
include_once('models/PatientsModel.php');
include_once('models/AreasModel.php');
include_once('models/NursesModel.php');

class PageController{

    public function __construct(){
        $this->pageView = new PageView();
        $this->callsModel = new CallsModel();
        $this->patientsModel = new PatientsModel();
        $this->areasModel = new AreasModel();
        $this->nursesModel = new NursesModel();
    }

    // Muestra el inicio
    public function showHome(){
        $calls = $this->callsModel->getByType("urgents");
        $patients = $this->patientsModel->getLast();
        $nurses = $this->nursesModel->getLast();
        $areas = $this->areasModel->getLast();
        $this->pageView->showHome($calls, $patients, $nurses, $areas);
    }

    // Pantalla de error
    public function showError(){
        $this->pageView->showError();
    }


}