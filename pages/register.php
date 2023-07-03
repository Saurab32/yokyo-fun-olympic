
<?php
  require("../database/connection.php"); 
  require("../database/function.php"); 
?>

<?php

	if (isset($_POST['btnSubmit'])) {
        extract($_POST);
		add_Users($connection,$first_name,$last_name,$email,$gender,$txt_password,$phone);        
	}
?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Register</title>
	

    <!-- Main CSS-->
    <link href="../assets/css/style3.css" rel="stylesheet" media="all">
</head>
<body>
 <div class="page-wrapper bg-gra-01 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Registration Form</h2>
                    <form method="POST" action="">
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">first name</label>
                                    <input class="input--style-4" type="text" name="first_name" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">last name</label>
                                    <input class="input--style-4" type="text" name="last_name" required>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <div class="input-group-icon">
                                        <input type="text" class="input--style-4" name="email" required>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <div class="p-t-10">
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" checked="checked" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Password</label>
                                    <input class="input--style-4" type="password" name="txt_password" required>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="text" name="phone" required>
                                </div>
                            </div>
                        </div>
                       
                        <div class="p-t-15">
                            <span style="text-align: center;"><input type="submit" class="btn btn--radius-2 btn--blue" name="btnSubmit" value="submit" ></span>
                        </div>
                    </form>
                   
                    
                </div>
            </div>
        </div>
    </div>
     

</body>
</html>