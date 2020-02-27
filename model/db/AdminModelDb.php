<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class AdminModelDb extends Crud
{
    public function addProduct($object)
    {
        $data = ['title' => $object->getTitle(), 'spec' => $object->getSpec(), 'subcategories_id' =>
            $object->getSubcategoryId(), 'price' => $object->getPrice(), 'quantity' => $object->getQuantity(),
            'visible' => $object->getVisible(), 'descrip' => $object->getDescribe()];

        $this->insert('products', $data);

        $this->addProductImage($object->getPhoto());
    }

    private function addProductImage($sys_path)
    {
        if(!empty($sys_path)){
            $product_image_dir = $_SERVER['DOCUMENT_ROOT'] . '/web/images/productImage/';
            $image_name = uniqid() . '.' . explode('/', $_FILES['image']['type'])[1];
            move_uploaded_file($sys_path, $product_image_dir . $image_name);
            try {
                $query = "UPDATE products SET image = :image WHERE id = LAST_INSERT_ID()";
                $prepare = Connect::gI()->prepare($query);
                $prepare->bindValue('image', $image_name);
                $prepare->execute();
            } catch (\PDOException $e) {
                Log::setRootLogDir('logs');
                $log = new Log(__METHOD__);
                $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
            }
        }
    }

    public function getSubCat()
    {
        try {
            $query = "SELECT * FROM subcategoris";
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