<?php


namespace controller;


use core\Controller;
use core\View;
use model\db\CategoryModelDb;

class CategoryController extends Controller
{

    public function __construct()
    {
        $this->model = new CategoryModelDb();
        $this->view = new View();
    }

    public function subAction()
    {
        $data['main'] = $this->model->getCatProduct($_GET['id']);
        $data['cat_name'] = $this->model->getSubCatName($_GET['id'])[0]['name'];

        $this->view->generate('view/category_view.php','main_template.php', $data);
    }

    public function mainAction()
    {
        $data['main'] = $this->model->getMainCatProducts($_GET['id']);
        $this->view->generate('view/category_view.php','main_template.php', $data);
    }
}