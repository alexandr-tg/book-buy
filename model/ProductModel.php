<?php


namespace model;


class ProductModel
{
    private $user_id;
    private $product_id;
    private $review;

    public function setUser($id)
    {
        $this->user_id = $id;
    }

    public function getUser()
    {
        return $this->user_id;
    }

    public function setProduct($id)
    {
        $this->product_id = $id;
    }

    public function getProduct()
    {
        return $this->product_id;
    }

    public function setReview($review)
    {
        $this->review = $review;
    }

    public function getReview()
    {
        return $this->review;
    }
}