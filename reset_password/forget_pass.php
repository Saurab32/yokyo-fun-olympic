<?php
session_start();
include(__DIR__.'/../includes/config.php');
require("../database/connection.php");
require("../database/function.php");

$message = $link = '';
if(isset($_POST['submit'])) {
    verifyCaptcha('forget_err');
	$request = (object) $_POST;
	$user = table('tbl_users')->where('user_email','=',$request->email)->first();
	if($user){
		$token = randomStr(6);
		// table('tbl_users')
		sendMail($request->email,$user->user_fname,"reset password","<a href=\"http://newsportal_old.test/reset_password/Reset_pass.php?MnoQtyPXZORTE=$token\">Click here</a> to reset passowrd");
		$message = "<div class='alert alert-success'> Valid Email Id..!!</div>";
	}else{
		$message = "<div class='alert alert-danger'>Invalid Email..!!</div>";
	}
	// $email = $_POST['email'];
	// $query = "SELECT * FROM tbl_users WHERE user_email = '".$email."'";
	// $result = $connection->query($query);
}
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>forget Password</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</head>
<body  class="bg-secondary">
		<div class="container w-50 mt-5">
			<form class="bg-light p-5 shadow-lg" method="post">
				<?php echo $message; ?>
                <?= flash_message('forget_err') ?>
				<h1 class="text-success">Forget Password</h1>
				<label for="Email">Email</label>
				<input type="email" name="email" placeholder="Email Address" class="form-control form-control-sm" required><br>
                <div class="g-recaptcha" data-sitekey="<?= config('recaptcha.site_key');  ?>"></div>
				<button type="submit" name="submit" class="btn btn-success btn-sm">Reset Password</button>
				<?php echo $link; ?>
			</form>
		</div>
</body>
</html>
