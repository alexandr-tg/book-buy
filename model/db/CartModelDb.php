<?php


namespace model\db;


use core\Log;
use core\Model;
use model\connect\Connect;

class CartModelDb extends Crud
{

    public function addCart($object)
    {
        $data = ['user_id' => $object->getUser(), 'product_id' => $object->getProduct()];
        $this->insert( 'user_cart', $data);
    }

    public function getCart($id)
    {
        try {
            $query = "SELECT p.id, p.title, p.image, p.price FROM products p JOIN user_cart u ON p.id = u.product_id AND 
            u.user_id = :id";
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

    public function removeCartUnit($data)
    {
        try {
            $query = "DELETE FROM user_cart WHERE user_id = :user_id AND product_id = :product_id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute($data);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }
}