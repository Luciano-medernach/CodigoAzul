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
        $calls = $this->callsModel->getAll();
        $this->callsView->showList($calls);
    }

}