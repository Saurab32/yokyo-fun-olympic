<?php
global $appConfig;
require_once __DIR__ . "/../vendor/autoload.php";
$appConfig =  require_once __DIR__ . "/../core/config/app.php";
require_once  __DIR__ . "/../core/helpers/functions.php";
debugMode();
initLoader();
$db_config =(object) config("database");
$con = mysqli_connect($db_config->host,$db_config->user,$db_config->password,$db_config->database);
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>