<?php


namespace model;


class UserModel
{
    private $f_name;
    private $l_name;
    private $email;
    private $password;
    private $enable;
    private $status;
    private $image;

    public function __construct()
    {
        $this->enable = 1;
        $this->status = 'user';
    }

    public function setName($name){
        $this->f_name = $name;
    }

    public function getName()
    {
        return $this->f_name;
    }

    public function setSurname($surname)
    {
        $this->l_name = $surname;
    }

    public function getSurname()
    {
        return $this->l_name;
    }

    public function setEmail($email)
    {
        $this->email = $email;
    }

    public function getEmail()
    {
        return $this->email;
    }

    public function setPassword($pass)
    {
        $this->password = $pass;
    }

    public function getPassword()
    {
        return $this->password;
    }

    public function setImage($image)
    {
        $this->image = $image;
    }

    public function getImage()
    {
        return $this->image;
    }

    public function getStatus()
    {
        return $this->status;
    }

    public function getEnable()
    {
        return $this->enable;
    }
}