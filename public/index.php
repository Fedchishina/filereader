<?php
/*
 * definition of constants
 */
define('ROOT', dirname(dirname(__FILE__)));

/*
 * general settings
 */
ini_set('display_errors', 1);
error_reporting(E_ALL);

/*
 * including
 */
require_once(ROOT.'/routing/Router.php');

/**
 * loading routes
 */
try {
    $router = new Router();
    $router->run();
}
catch (Exception $e) {
    header($_SERVER['SERVER_PROTOCOL'] . ' 500 Internal Server Error', true, 500);
    echo '<pre>'. $e->getMessage() . '</pre><br>';
    echo '<pre>'. $e->getTraceAsString() . '</pre><br>';
    exit;
}