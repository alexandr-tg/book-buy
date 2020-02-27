<?php


namespace model;


class CartModel
{
    private $user;
    private $product;

    public function setUser($id)
    {
        $this->user = $id;
    }

    public function getUser()
    {
        return $this->user;
    }

    public function setProduct($id)
    {
        $this->product = $id;
    }

    public function getProduct()
    {
        return $this->product;
    }
}