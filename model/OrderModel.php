<?php


namespace model;


class OrderModel
{
    private $user_id;
    private $create_time;
    private $ship_address;
    private $sum;


    public function __construct()
    {
        $this->create_time = date('Y-m-d H:i:s');
    }

    public function setUser($user_id)
    {
        $this->user_id = $user_id;
    }

    public function getUser()
    {
        return $this->user_id;
    }

    public function getCreateTime()
    {
        return $this->create_time;
    }

    public function setShipAddress($address)
    {
        $this->ship_address = $address;
    }

    public function getShipAddress()
    {
        return $this->ship_address;
    }

    public function setSum($sum)
    {
        $this->sum = $sum;
    }

    public function getSum()
    {
        return $this->sum;
    }

}