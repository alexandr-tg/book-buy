<?php


namespace model\db;


use core\Log;
use model\connect\Connect;

class Crud
{
    protected function insert($table, $data)
    {
        $fields = implode(',', array_keys($data));
        $values = ':' . implode(', :', array_keys($data));
        try{
            $query = "INSERT INTO {$table} ({$fields}) VALUES ({$values})";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute($data);
        } catch (\PDOException $e){
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    protected function select($table, $data)
    {
        $fields = implode(',', $data);
        try{
            $query = "SELECT {$fields} FROM {$table}";
            $prepare = Connect::gI()->prepare($query);
            $prepare->execute(array());
            return $prepare->fetchAll(\PDO::FETCH_ASSOC);
        } catch (\PDOException $e){
            Log::setRootLogDir('logs');
            $log = new Log(__METHOD__);
            $log->log(date('Y-m-d H:i:s') . ' ' . $e->getMessage());
        }
    }

    protected function update()
    {

    }

    protected function delete()
    {

    }

}