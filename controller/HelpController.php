<?php


namespace controller;


use core\Controller;
use core\View;
use model\db\HelpModelDb;

class HelpController extends Controller
{

    public function __construct()
    {
        $this->model = new HelpModelDb();
        $this->view = new View();
    }

    public function showAction()
    {
        echo 'Coming soon';
    }

}