<?php


namespace controller;


use core\Controller;
use core\View;
use model\db\CartModelDb;
use model\db\OrderModelDb;
use model\OrderModel;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->model = new OrderModelDb();
        $this->view = new View();
    }

    public function createAction()
    {
        $cartData = new CartModelDb();
        $cartData = $cartData->getCart($_SESSION['user_id']);

        foreach ($cartData as $key => $value) {
            $array[] = $value['id'];
            $sum += $value['price'];
        }

        $order = new OrderModel();
        $order->setUser($_SESSION['user_id']);
        $order->setShipAddress(htmlentities($_POST['ship_address']));
        $order->setSum(trim($sum, '$'));
        $this->model->createOrder($order);


        $lastUserOrder = $this->model->getNewOrderNum()[0]['id'];

        foreach (array_count_values($array) as $key => $value) {
            $this->model->addOrderProduct(['order_id' => $lastUserOrder, 'product_id' => $key,
                'quantity' => $value]);
        }

        $this->model->cleanCart($_SESSION['user_id']);

        header("Location: /");
    }

    public function showAction()
    {
        $userOrders = $this->model->getAllUserOrder($_SESSION['user_id']);

        foreach ($userOrders as $key => $value){
            $nameQuantity = $this->model->getOrderProduct($value['id']);
            foreach ($nameQuantity as $item){
                if($item['order_id'] == $value['id']){
                    $data[] = ['id' => $value['id'], 'title' => $item['title'], 'quantity' => $item['quantity'],
                        'status' => $value['status'], 'create_time' => $value['create_time'],
                        'ship_address' => $value['ship_address'], 'sum' => $value['sum'], 'product_id' => $item['id']];
                }
            }
        }

        $this->view->generate('view/order_view.php', 'main_template.php', $data);
    }

    public function formAction()
    {
        $this->view->generate('view/create_order_view.php', 'main_template.php');
    }
}