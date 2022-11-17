<?php

include_once('views/CallsView.php');
include_once('models/CallsModel.php');

class CallsController{

    public function __construct(){
        $this->callsView = new CallsView();
        $this->callsModel = new CallsModel();
    }

    // Muestra el listado de llamadas
    public function showList(){
        $this->callsView->showList();
    }

    // Imprime todas las llamadas
    public function getAll(){
        $calls = $this->callsModel->getAll();
        echo json_encode($calls);
    }

}