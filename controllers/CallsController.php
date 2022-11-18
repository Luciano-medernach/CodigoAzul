<?php

include_once('views/CallsView.php');
include_once('models/CallsModel.php');

include_once('helpers/auth.helper.php');


class CallsController{

    public function __construct(){
        $this->callsView = new CallsView();
        $this->callsModel = new CallsModel();
    }

    // Muestra el listado de llamadas
    public function showList(){
        AuthHelper::checkLoggedIn();

        $area = $_GET["area"];

        if($area != ""){
            $count = $this->callsModel->getCountArea($area);
        } else {
            $count = $this->callsModel->getCount();
        }

        $this->callsView->showList(floor($count->count/50), $area);
    }

    // Imprime todas las llamadas
    public function getAll(){
        AuthHelper::checkLoggedIn();

        $page = $_GET["page"];
        $area = $_GET["area"];
        
        if($area != ""){
            $calls = $this->callsModel->getByArea($page, $area);
        } else {
            $calls = $this->callsModel->getAll($page);
        }
        
        echo json_encode($calls);
    }

}