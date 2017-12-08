<?php

class Router
{
    private $routes;

    public function __construct()
    {
        $routesPath = ROOT . '/config/routes.php';
        $this->routes = include($routesPath);
    }

    /**
     * return URI without GET parameters
     * @return string
     */
    private function getURI()
    {
        if (!empty($_SERVER['REQUEST_URI'])) {
            $uri =  trim($_SERVER['REQUEST_URI'], '/');
            $str=strpos($uri, "?");
            if ($str === false) {
                return $uri;
            }
            return substr($uri, 0, $str);
        }
        return false;
    }

    /**
     * calling controller method on sent router in URI
     */
    public function run()
    {
        $uri = $this->getURI();
        foreach ($this->routes as $uriPattern => $path) {
            if (preg_match("~^$uriPattern~", $uri)) {
                $internalRoute = preg_replace("~$uriPattern~", $path, $uri);
                $segments = explode('/', $internalRoute);
                //получаем имя контроллера
                $controllerName = ucfirst(array_shift($segments).'Controller');
                //получаем имя метода в контроллере
                $actionName = 'action'.ucfirst(array_shift($segments));
                //получаем параметры, которые надо передать
                $controllerFile = ROOT . '/app/Controllers/' . $controllerName . '.php';
                if (file_exists($controllerFile)) {
                    //подключение файла контроллера
                    include_once($controllerFile);
                }
                //создание объекта контроллера
                $controllerObject = new $controllerName;
                //вызов метода контроллера с передачей параметров (не массивом, а значениями параметров)
                $result = call_user_func_array(array($controllerObject, $actionName), []);
                if($result != null) {
                    break;
                }
            }
        }
    }
}