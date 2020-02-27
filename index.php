<?php
session_start();
require_once 'vendor/autoload.php';
require_once 'utility/error_handler.php';
$route = new \core\Router();
$route->start();