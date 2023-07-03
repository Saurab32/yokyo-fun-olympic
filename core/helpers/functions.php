<?php

function initLoader()
{
    spl_autoload_register(function ($class_name) {
        $class_name = rootPath . "/" . str_replace("\\", "/", $class_name) . ".php";
        if(file_exists($class_name)){
            require_once $class_name;
        }
    });
}

function loadEnv()
{
    $envFilePath =  __DIR__ . "/../../.env";
    if (file_exists($envFilePath)) {
        $envVariables = parse_ini_file($envFilePath);
        foreach ($envVariables as $key => $value) {
            putenv("$key=$value");
        }
    }
}
