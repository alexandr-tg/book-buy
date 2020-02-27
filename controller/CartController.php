<?php


namespace controller;


use core\Controller;
use core\View;
use model\CartModel;
use model\db\CartModelDb;
use model\WishModel;

class CartController extends Controller
{
    public function __construct()
    {
        $this->model = new CartModelDb();
        $this->view = new View();
    }


    public function addAction()
    {
        $cart = new CartModel();
        $cart->setUser($_SESSION['user_id']);
        $cart->setProduct($_GET['add_cart']);
        $this->model->addCart($cart);

        header("Location: {$_SERVER['HTTP_REFERER']}");
    }

    public function showAction()
    {
        $data['main'] = $this->model->getCart($_SESSION['user_id']);
        $this->view->generate('view/cart_view.php', 'main_template.php', $data);
    }

    public function removeAction()
    {
        $this->model->removeCartUnit(['user_id' => $_SESSION['user_id'], 'product_id' =>
        $_GET['id']]);
        header("Location: {$_SERVER['HTTP_REFERER']}");
    }
}