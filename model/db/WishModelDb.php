<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class WishModelDb extends Crud
{

    public function addWish($object)
    {
        $data = ['user_id' => $object->getUser(), 'product_id' => $object->getProduct()];
        $this->insert( 'favorites', $data);
    }

    public function getWish($id)
    {
        try {
            $query = "SELECT p.id, p.title, p.image, p.price FROM products p JOIN favorites u ON p.id = u.product_id AND 
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

    public function removeWishUnit($data)
    {
        try {
            $query = "DELETE FROM favorites WHERE user_id = :user_id AND product_id = :product_id";
            $query = Connect::gI()->prepare($query);
            $query->execute($data);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }
}