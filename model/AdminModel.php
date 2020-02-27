<?php


namespace model;


class AdminModel
{
    private $title;
    private $spec;
    private $visible;
    private $subcategory_id;
    private $price;
    private $quantity;
    private $photo;
    private $describe;

    public function __construct()
    {
        $this->visible = 1;
    }

    public function setTitle($title)
    {
        $this->title = $title;
    }

    public function getTitle()
    {
        return $this->title;
    }

    public function setSpec($spec)
    {
        $this->spec = $spec;
    }

    public function getSpec()
    {
        return $this->spec;
    }

    public function setSubcategoryId($id)
    {
        $this->subcategory_id = $id;
    }

    public function getSubcategoryId()
    {
        return $this->subcategory_id;
    }

    public function setPrice($price)
    {
        $this->price = $price;
    }

    public function getPrice()
    {
        return $this->price;
    }

    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;
    }

    public function getQuantity()
    {
        return $this->quantity;
    }

    public function setPhoto($photo)
    {
        $this->photo = $photo;
    }

    public function getPhoto()
    {
        return $this->photo;
    }

    public function getVisible()
    {
        return $this->visible;
    }

    public function setDescribe($describe){
        $this->describe = $describe;
    }

    public function getDescribe()
    {
        return $this->describe;
    }

}