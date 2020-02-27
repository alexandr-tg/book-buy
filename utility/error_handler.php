<?php
function e_log($err_no, $err_massage){
    $massage = date('Y-m-d H:i:s') . ' ' . $_SERVER['SCRIPT_NAME'] . " $err_no || $err_massage";
    \core\Log::setRootLogDir('logs');
    $log = new \core\Log('errors.log');
    $log->log($massage);
}

set_error_handler('e_log');