<?php
session_start();
include("includes/config.php");
$_SESSION['login']=="";
session_unset();
session_destroy();

?>
<script language="javascript">
document.location="/newsportal/index.php";
</script>
