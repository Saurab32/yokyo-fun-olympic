<?php 

function add_Users($connection,$first_name,$last_name,$email,$gender,$txt_password,$phone)
	{
		$sql = "
		Insert into 
		tbl_users 
		(user_fname,
		user_lname,
		user_password,
		user_email,
		user_phone,
		gender
		 
		) 
		values 
		('$first_name','$last_name',md5('$txt_password'),'$email','$phone','$gender')";
	
		$compile = mysqli_query($connection,$sql);
		if($compile) {
			echo "<script>alert('Registration Successful');</script>";
			echo "<script>window.location='login.php';</script>";
			
		}else{
			echo "<script>alert('User not registered with us');</script>";
		}

	}


function checkLogin_cus($connection,$email,$pass)
	{
		$sql = "Select * from tbl_users where user_email = '$email' and user_password = md5('$pass') ";
		$compile = mysqli_query($connection,$sql);
		$context = mysqli_fetch_row($compile);
		if(mysqli_num_rows($compile) == true){
			$_SESSION['user'] = $context[1];
			$_SESSION['id'] = $context[0];

			echo "<script>window.location='../index.php';</script>";

		}
		else{
			echo "<script>alert('Not Valid User');</script>";
			
		}

	}



?>