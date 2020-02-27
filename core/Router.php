<?php

namespace core;

class Router
{
    public function start()
    {
        $controller_name = 'home';
        $action_name = 'index';

        $routes = explode('/', $_SERVER['REQUEST_URI']);
        foreach ($routes as $key => $value) {
            $route = parse_url($value);
            if(isset($route['query'])){
                unset($routes[$key]);
            }
        }

        if(!empty($routes[1])){
            $controller_name = $routes[1];
        }

        if (!empty($routes[2])){
            $action_name = $routes[2];
        }

        $controller_path = '\\controller\\' . $controller_name . 'Controller';

        $controller = new $controller_path();
        $action = $action_name . 'Action';

        if(method_exists($controller, $action)){
            $controller->$action();
        } else {
            self::errorPage404();
        }
    }

    public static function errorPage404()
    {
        echo 'Error 404';
    }
}