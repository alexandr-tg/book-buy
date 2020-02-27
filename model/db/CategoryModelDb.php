<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class CategoryModelDb extends ProductModelDb
{
    public function getCatProduct($catId)
    {
        try {
            $query = "SELECT id, title, image, price FROM products WHERE subcategories_id = :id";
            $prepare = Connect::gI()->prepare($query);
            $prepare->bindValue('id', $catId);
            $prepare->execute();
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e) {
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    public function getMainCatProducts($id)
    {
        try {
            $query = "SELECT p.id, p.title, p.image, p.price FROM products p JOIN subcategoris s ON
            p.subcategories_id = s.id AND s.categories_id = :";
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
}