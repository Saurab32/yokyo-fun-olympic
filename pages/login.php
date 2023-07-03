<?php
  session_start(); 
  require("../database/connection.php"); 
  require("../database/function.php"); 
?>


<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login Form</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">


<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="../assets/css/main2.css">
<!--===============================================================================================-->
</head>
<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="POST" action="login.php">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="email">
						<span class="focus-input100"></span>
						<span class="label-input100">Email</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="pass">
						<span class="focus-input100"></span>
						<span class="label-input100">Password</span>
					</div>

					<div class="flex-sb-m w-full p-t-3 p-b-32">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<a href="register.php" class="txt1">
								Register
							</a>
							
						</div>

						<div>
							
							<a href="../reset_password/forget_pass.php" class="txt1">
								Forgot Password?
							</a>
						</div>
					</div>
			

					<div class="container-login100-form-btn">
						<input type="submit" name="btn_submit" class="login100-form-btn">
						
					
					</div>
										
				</form>

				<div class="login100-more" style="background-image: url('../assets/images/bg-01.jpg?<?php time() ?>');">
				</div>
			</div>
		</div>
	</div>
	

	<script src="../assets/js/main.js"></script>

</body>
</html>

<?php
		
		if(isset($_POST['btn_submit']))
		{
			extract($_POST);
			checkLogin_cus($connection,$email,$pass);
		}

?>