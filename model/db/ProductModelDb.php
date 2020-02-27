<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class ProductModelDb extends Crud
{

    public function getTheProduct($id)
    {
        try {
            $query = "SELECT id, title, spec, descrip, price, image, subcategories_id FROM products WHERE id = :id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue(':id', $id);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getProductReview($id)
    {
        try {
            $query = "SELECT p.review, u.f_name, u.l_name, u.image FROM product_review p JOIN users u ON p.user_id = u.id 
        AND p.product_id = :id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue('id', $id);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getSubCatName($sub_cat_id)
    {
        try {
            $query = "SELECT * FROM subcategoris WHERE id = :sub_cat_id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue(':sub_cat_id', "$sub_cat_id");
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }

    }

    public function getProductTheSameCat($id, $sub_cat_id)
    {
        try {
            $query = "SELECT id, title, price, image FROM products WHERE id != :id AND subcategories_id = :sub_cat_id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue('id', $id);
            $prepare->bindValue('sub_cat_id', $sub_cat_id);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function addProductReview($object)
    {
        $data = ['user_id' => $object->getUser(), 'product_id' => $object->getProduct(), 'review' => $object->getReview()];
        $this->insert('product_review', $data);
    }
}