<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class OrderModelDb extends Crud
{

    public function createOrder($object)
    {
        $data = ['user_id' => $object->getUser(), 'create_time' => $object->getCreateTime(),
            'ship_address' => $object->getShipAddress(), 'sum' => $object->getSum()];
        $this->insert('orders', $data);
    }

    public function addOrderProduct($data)
    {
        $this->insert('order_products', $data);
    }

    public function cleanCart($id)
    {
        try {
            $query = "DELETE FROM user_cart WHERE user_id = :id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue('id', $id);
            $prepare->execute();
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getAllUserOrder($user_id)
    {
        try {
            $query = "SELECT * FROM orders WHERE user_id = :id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue('id', $user_id);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getOrderProduct($order_id)
    {
        try {
            $query = "SELECT op.order_id, op.quantity, p.id, p.title, p.id FROM order_products op JOIN products p ON op.product_id = p.id
            AND op.order_id = :order_id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue('order_id', $order_id);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getNewOrderNum()
    {
        try {
            $query = "SELECT o.id FROM orders o JOIN users u ON o.user_id = u.id AND o.id = LAST_INSERT_ID()";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }
}