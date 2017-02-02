<?php 
	if (!isset($_SESSION['usuario'])){
		header("Location:../");
	}
?>
<header class="main-header">
    	<a href="../index.php" class="logo">
      	<span class="logo-mini">HOTEL</span>
      	<span class="logo-lg"><b>HOTEL</b>TARAPOTO</span>
    	</a>

    	<nav class="navbar navbar-static-top">
	     	<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
	        	<span class="sr-only">Toggle navigation</span>
	        	<span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
	     	</a>

      	<div class="navbar-custom-menu">
	        	<ul class="nav navbar-nav">
		          	<li class="dropdown notifications-menu">
		            	<a href="#"><b>SOFTWARE HOTEL TARAPOTO</b></a>
		          	</li>
		          	<!--<li class="dropdown tasks-menu">
			           	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
			              	<i class="fa fa-flag-o"></i>
			              	<span class="label label-danger">9</span>
			           	</a>
			           	<ul class="dropdown-menu">
			              	<li class="header">You have 9 tasks</li>
			              	<li class="footer">
			                		<a href="#">View all tasks</a>
			              	</li>
			           	</ul>
		          	</li> -->

		          	<li class="dropdown user user-menu">
		            	<a href="#" class="dropdown-toggle" data-toggle="dropdown">
		              		<img src="../public/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
		              		<span class="hidden-xs"><?php echo $_SESSION['usuario'];?></span>
		            	</a>
		            	<ul class="dropdown-menu">
			              	<li class="user-header">
				                	<img src="../public/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
				                	<p> <?php echo $_SESSION['usuario'];?> - Desarrollador Web</p>
			              	</li>
			              	<li class="user-footer">
			                		<div class="pull-right">
			                  		<a href="../index.php" class="btn btn-default btn-flat">Cerrar sesion</a>
			                		</div>
			              	</li>
		            	</ul>
		          	</li>
	        	</ul>
      	</div>
    	</nav>
</header>