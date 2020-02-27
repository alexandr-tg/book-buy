<?php


namespace core;

class Log
{
    private static $rootLogDir;
    private $pathLog;

    public function __construct($pathValue)
    {
        if(empty(self::$rootLogDir)){
            throw new \Exception('Must set root path dir');
        }

        $path = $this->getValidPath($pathValue);
        $this->pathLog = self::$rootLogDir . '/' . $path;

        if(!file_exists($this->pathLog)){
            $arrayPath = explode('/', $path);

            $currentPathString = self::$rootLogDir . '/';
            foreach ($arrayPath as $key => $value) {
                $currentPathString .= $value . '/';

                if(file_exists($currentPathString)){
                    continue;
                }

                if($key == count($arrayPath) - 1){
                    continue;
                }

                mkdir($currentPathString);
            }
        }
    }

    public static function setPathByClass($pathClass)
    {
        return new Log($pathClass . '.log');
    }

    public static function setPathByMethod($pathMethod)
    {
        $pathMethod = str_replace('::', '/', $pathMethod);
        return new Log($pathMethod . '.log');
    }

    public function log($text)
    {
        $file = fopen($this->pathLog, 'a+');
        $massage = PHP_EOL . '---New Log---' .  PHP_EOL . $text . PHP_EOL;
        fwrite($file, $massage);
        fclose($file);
    }


    public static function setRootLogDir($pathValue)
    {
        self::$rootLogDir = $pathValue;
    }

    private function getValidPath($pathValue)
    {
        $path = trim(str_replace('\\', '/', $pathValue),'/');
        return $path;
    }

}