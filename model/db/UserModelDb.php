<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class UserModelDb extends Crud
{
    public function regUser($object)
    {
        $data = ['f_name' => $object->getName(), 'l_name' => $object->getSurname(), 'email' => $object->getEmail(),
            'password' => $object->getPassword()];
        $this->insert('users', $data);
    }

    public function authUser($object)
    {
        $data = ['email' => $object->getEmail(), 'password' => $object->getPassword(), 'status' => 'field',
            'id' => 'field', 'enable' => 'field'];
        $field = implode(",", array_keys($data));
        $params = ['email' => $data['email']];
        try{
            $query = "SELECT {$field} FROM users WHERE email = :email";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute($params);
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e){
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }
}