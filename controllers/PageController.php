<?php

include_once('views/PageView.php');
include_once('models/CallsModel.php');
include_once('models/PatientsModel.php');
include_once('models/AreasModel.php');

class PageController{

    public function __construct(){
        $this->pageView = new PageView();
        $this->callsModel = new CallsModel();
        $this->patientsModel = new PatientsModel();
        $this->areasModel = new AreasModel();
    }

    // Muestra el inicio
    public function showHome(){
        $patients = $this->patientsModel->getLast();
        $calls = $this->callsModel->getByType("urgents");
        $areas = $this->areasModel->getLast();
        $this->pageView->showHome($calls, $patients, $areas);
    }

    // Pantalla de error
    public function showError(){
        $this->pageView->showError();
    }


}