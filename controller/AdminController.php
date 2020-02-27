<?php


namespace controller;


use Composer\Package\Loader\ValidatingArrayLoader;
use core\Controller;
use core\View;
use model\AdminModel;
use model\db\AdminModelDb;
use model\db\CategoryModelDb;

class AdminController extends Controller
{

    public function __construct()
    {
        $this->model = new AdminModelDb();
        $this->view = new View();
    }

    public function panelAction()
    {
        if($_SESSION['role'] == 'admin'){
            $this->view->generate('view/admin/admin_panel_view.php', 'main_template.php');
        } else {
            header('Location: /');
        }
    }

    public function addGoodViewAction()
    {
        if ($_SESSION['role'] == 'admin'){
            $data = $this->model->getSubCat();
            $this->view->generate('view/admin/add_good_view.php', 'main_template.php', $data);
        } else {
            header('Location: /');
        }
    }

    public function addGoodAction()
    {
        if($_SESSION['csrf_token'] == $_POST['token']){
            $product = new AdminModel();
            $product->setTitle($_POST['title']);
            $product->setSpec($_POST['spec']);
            $product->setSubcategoryId($_POST['subcategories_id']);
            $product->setPrice($_POST['price']);
            $product->setQuantity($_POST['quantity']);
            $product->setPhoto($_FILES['image']['tmp_name']);
            $product->setDescribe($_POST['describe']);
            $this->model->addProduct($product);
        } else {
            die('token wrong');
        }

        header("Location: {$_SERVER['HTTP_REFERER']}");
    }

}