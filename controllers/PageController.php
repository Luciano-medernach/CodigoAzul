<?php

include_once('views/PageView.php');

class PageController{

    public function __construct(){
        $this->pageView = new PageView();
    }

    // Muestra el inicio
    public function showHome(){
        $this->pageView->showHome();
    }

    // Pantalla de error
    public function showError(){
        $this->pageView->showError();
    }

}