<?php


namespace controller;


use core\Controller;
use core\Model;
use core\View;
use model\connect\Connect;
use model\db\ProductModelDb;
use model\ProductModel;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->model = new ProductModelDb();
        $this->view = new View();
    }

    public function reviewAction()
    {
        $review = $this->reviewValidation();
        if(!empty($review)) $this->model->addProductReview($review);
        header("Location: {$_SERVER['HTTP_REFERER']}");
    }

    private function reviewValidation()
    {
        $user = $_SESSION['user_id'];
        $product_id = trim(explode('?', $_SERVER['HTTP_REFERER'])[1], 'id=');
        $user_review = $_POST['review'];
        if(!empty($user_review) && !empty($product_id) && !empty($user)){

            if(!(ctype_alnum($user) && ctype_alnum(($product_id)))){
                die();
            }

            if(!($_SESSION['csrf_token'] === $_POST['token'])){
                die();
            }

            $review = new ProductModel();
            $review->setUser($user);
            $review->setProduct(htmlentities($product_id));
            $review->setReview(htmlentities($user_review));
            return $review;
        }
    }

    public function showAction()
    {
        $data = $this->model->getTheProduct($_GET['id'])[0];
        $data['spec'] = $this->specFormat($data['spec']);
        $data['discount'] = $data['price'] * 0.2 + $data['price'];
        $data['review'] = $this->model->getProductReview($_GET['id']);
        $data['sub_cat'] = $this->model->getSubCatName($data['subcategories_id'])[0];
        $data['same_cat'] = $this->model->getProductTheSameCat($_GET['id'], $data['subcategories_id']);
        $this->view->generate('view/product_view.php', 'main_template.php', $data);
    }

    public function specFormat($spec)
    {
        $data = explode('/', $spec);
        return $data = array_map(function ($n){
            return trim($n);
            }, $data);
    }
}