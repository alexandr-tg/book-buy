<?php


namespace controller;


use core\Controller;
use core\View;
use model\db\WishModelDb;
use model\WishModel;

class WishController extends Controller
{
    public function __construct()
    {
        $this->model = new WishModelDb();
        $this->view = new View();
    }

    public function addAction()
    {
        $wish = new WishModel();
        $wish->setUser($_SESSION['user_id']);
        $wish->setProduct($_GET['add_wish']);
        $this->model->addWish($wish);

        header("Location: {$_SERVER['HTTP_REFERER']}");
    }

    public function showAction()
    {
        $data = $this->model->getWish($_SESSION['user_id']);
        $this->view->generate('view/wish_list_view.php', 'main_template.php', $data);
    }

    public function removeAction()
    {
        $this->model->removeWishUnit(['user_id' => $_SESSION['user_id'], 'product_id' =>
            $_GET['id']]);
        header("Location: {$_SERVER['HTTP_REFERER']}");
    }
}