
<!doctype html>
<html lang="en"><head>
    <meta charset="utf-8">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="" type="image/gif" sizes="16x16">
    <title>CoderOJ - Competitive Programming Platform</title>
    <link rel="icon" href="file/site_metarial/fav.png" type="image/gif" sizes="16x16">

    <!-- CSS Javascript Libery -->
    <?php include "include/layout/lib.php"; ?>
    
    <head>
        <?php
            include "include/layout/nav_bar.php"; 
            include "include/layout/modal_lib.php"; 

         ?>
    </head>

    <?php
        if($isLoggedIn)
            echo "<script>setTimeout(function(){ update_site_status(); }, 500);</script>";

    ?>

	<body class="theme-blue">
	   <div class="container" style="height: 100%; margin-top: 90px;">  
