<?php

use core\classes\EmailService;

function dd(...$args)
{
    foreach ($args as $x) {
        echo "<pre>";
        print_r($x);
        echo "</pre>";
    }
    die();
}
function initLoader()
{
    spl_autoload_register(function ($class_name) {
        $class_name = __DIR__ . "/../../" . str_replace("\\", "/", $class_name) . ".php";
        if(file_exists($class_name)){
            require_once $class_name;
        }
    });
}
function config(string $configName)
{
    global $appConfig;
    $configArr = explode(".", $configName);
    $configValue =null;
    foreach ($configArr as $key=>$config) {
        if($key == 0){
            $configValue = $appConfig[$config];
        }else{
            $configValue = $configValue[$config];
        }
    }
    return $configValue;
}

function debugMode()
{
    if(config("app.debug")){
        //enable debug
        ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
    }else{
        //disable debug
        ini_set('display_errors', 0);
        ini_set('display_startup_errors', 0);
    }
    return config("app.debug");
}
function table(string  $tableName){
    return \core\classes\DB::init()->table($tableName);
}

function flash($key,$value,$type="success"){
    $_SESSION[$key] = [
        "value"=>$value,
        "type"=>$type
    ];
}
function flashSuccess($key,$value){
    flash($key,$value,"success");
}
function flashError($key,$value){
    flash($key,$value,"danger");
}

function flash_message($key="error"){
    if(isset($_SESSION[$key])){
        $value = $_SESSION[$key];
        unset($_SESSION[$key]);
        return "<style> .alert { padding: 10px; border-radius: 5px; border: 1px solid lightgrey; margin-top: 5px; margin-bottom: 5px; } .alert-success{ background-color: #d4edda; border-color: #c3e6cb; color: #155724; } .alert-danger{ background-color: #f8d7da; border-color: #f5c6cb; color: #721c24; }</style><div class='alert alert-{$value['type']}'>{$value['value']}</div>";
    }
    return null;
}
function sendMail(string $email,string $name,string $subject,string $message){
    $emailService = new EmailService();
    $emailService->send(
        $email,
        $name,
        $subject,
        $message
    );
}

function verifyCaptcha(string $flash_key="error"){
    if(!\core\classes\ReCaptchaService::verify($_POST['g-recaptcha-response'])){
        flash($flash_key,"Invalid Captcha","danger");
        header("Location: ".$_SERVER['HTTP_REFERER']);
        die();
    }
}


function randomStr($length = 1) {
    $characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    $charactersLength = strlen($characters);
    $randomString = '';

    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }

    return $randomString;
}