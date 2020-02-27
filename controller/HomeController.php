<?php

namespace controller;

use core\Controller;
use core\View;
use model\db\CartModelDb;
use model\db\HomeModelDb;

class HomeController extends Controller
{
    public function __construct()
    {
        $this->model = new HomeModelDb();
        $this->view = new View();
    }

    public function pagination()
    {
        if(isset($_GET['page'])){
            $page = $_GET['page'];
        } else {
            $page = 1;
        }

        $count_items = 20;
        $offset = ($page-1) * $count_items;
        $total_rows = $this->model->getCountRows()[0]['count_rows'];
        $total_pages = ceil($total_rows/$count_items);
        $data['data'] = $this->model->pagination($offset, $count_items);
        $data['page'] = $page;
        $data['total_page'] = $total_pages;
        return $data;
    }

    public function indexAction()
    {
        $data = $this->pagination();
        $data['best_seller'] = $this->model->getBestSeller();
        $data['new_arrivals'] = $this->model->getNewArrivals();

        $this->view->generate('view/home_view.php', 'main_template.php', $data);
    }
}