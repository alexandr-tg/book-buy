<?php


namespace model\db;


use core\Log;
use core\Model;
use model\connect\Connect;

class HomeModelDb extends Model
{

    public function getBestSeller()
    {
        try {
            $query = "SELECT id, title, price, image FROM products ORDER BY sold DESC";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getNewArrivals()
    {
        try {
            $query = "SELECT id, title, price, image FROM products ORDER BY id DESC";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function pagination($offset, $count_items)
    {
        try {
            $query = "SELECT * FROM products LIMIT {$offset}, {$count_items}";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e){
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getCountRows()
    {
        try {
            $query = "SELECT COUNT(*) as count_rows FROM products";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e){
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }

    }

}