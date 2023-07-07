 <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-primary fixed-top">
     <div class="container">
        
        <a class="navbar-brand" href="index.php"><img src="images/funolympic.png" height="50"></a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
             data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
             aria-label="Toggle navigation">
             <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
             <ul class="navbar-nav ml-auto">
                 <li class="nav-item">
                     <a class="nav-link" href="about-us.php">About</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" href="category.php?catid=11">News</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" href="news-details.php?nid=15">Highligts</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" href="news-details.php?nid=14">Schedule</a>
                 </li>
                 <li class="nav-item">
                     <a class="nav-link" href="contact-us.php">Contact us</a>
                 </li>
                 <?php
                if (isset($_SESSION['id'])) 
                {
                ?>
                 <li class="nav-item">
                     <a href="pages/logout.php" class="nav-link">Log out</a>
                 </li>
                 <?php
                }
            ?>
                 <?php
              if (!isset($_SESSION['id'])) 
              {
              ?>
                 <li class="nav-item">
                     <a href="pages/login.php" class="nav-link">Login</a>
                 </li>
                 <?php 
              }
            ?>
                 <li>
                     <?php if(isset($_SESSION['id']) && $_SESSION['user']) {
                        $users = $_SESSION['user'];
                      ?>
                     <a href="#" class="nav-link">
                         Hello: <?php echo $users; ?> 
                     </a>
                     <?php 
                        }  
                      ?>
                 </li>
             </ul>
         </div>
     </div>
 </nav>