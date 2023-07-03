<?php
require_once 'core/helpers/functions.php';
initLoader();
loadEnv();
$con = mysqli_connect(getenv("DB_SERVER"),getenv("DB_USER"),getenv("DB_PASS"),getenv("DB_NAME"));
// Check connection
if (mysqli_connect_errno())
{
 echo "Failed to connect to MySQL: " . mysqli_connect_error();
}
?>