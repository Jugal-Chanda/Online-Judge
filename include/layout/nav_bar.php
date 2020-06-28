  <?php $page=$Site->getBackPageUrl(); ?>
  <nav class="navbar navbar-default navbar-fixed-top navbar_style" style="border-color: var(--bg-color)">

  <div class="container-fluid"> 
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <style type="text/css">.delHoverA:hover{text-decoration: none;}</style>
      <b class="navbar-brand nav_logo"><strong style="color: #ffffff;"><a href="index.php" class="delHoverA coderOJLogo" >CoderOJ<strong color="#ced6e0;"><sup>&alpha;</sup></strong></strong></a></b>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    <div class="nevbar_fontstyle">
      <ul class="nav navbar-nav navbar-left" >
        <li class="li_nav"><a class="navbar_btn" style="color: #ced6e0;"  href="index.php"><i class="fas fa-home span_icon"></i>HOME</a></li> 
        <li class="li_nav"><a class="navbar_btn" style="color: #ced6e0;"  href="contest_list.php"><i class="fas fa-trophy span_icon"></i>CONTEST</a></li> 
        <li class="li_nav"><a class="navbar_btn" style="color: #ced6e0;" href="problems.php"><span class="glyphicon glyphicon-list span_icon"></span>PROBLEMS</a></li>
        <li class="li_nav"><a class="navbar_btn" style="color: #ced6e0;" href="submissions.php"><i class="fas fa-random span_icon"></i>JUDGE STATUS</a></li>
        <li class="li_nav"><a class="navbar_btn" style="color: #ced6e0;" href="rank_list.php"><i class="fas fa-trophy span_icon"></i>RANK LIST</a></li>
       <?php if($DB->userRole<=20){ ?>
        <li class="li_nav"><a class="navbar_btn" style="color: #ced6e0;" href="admin_dashboard.php"><span class="glyphicon glyphicon-dashboard span_icon"></span>ADMIN DASHBOARD</a></li>
       <?php } ?> 
      </ul>
       <ul class="nav navbar-nav navbar-right">
        <?php if(!$isLoggedIn){ ?>
          <li><a class="navbar_style2" style="color: #ced6e0;" href="register.php?back=<?php echo $page; ?>"><i class='fas span_icon'>&#xf234;</i> REGISTER</a></li>
          <li><a class="navbar_style2" style="color: #ced6e0;" href="login.php?back=<?php echo $page; ?>"><span class="glyphicon glyphicon-log-in span_icon"></span> LOGIN</a></li>
        <?php } else{ ?>
            <li><a class="navbar_style2" style="color: #ced6e0;" href="profile.php?id=<?php echo $DB->isLoggedIn; ?>">
              <img src="<?php echo $loggedInUserInfo['userPhoto']; ?>" class="navProfileImage">
              <?php echo strtoupper($loggedInUserInfo['userHandle']); ?></a>
            </li>
            <li><a class="navbar_style2" style="color: #ced6e0;" href="logout.php?back=<?php echo $page; ?>"><span class="glyphicon glyphicon-log-in span_icon"></span> LOGOUT</a></li>
        <?php } ?>

      </ul>
      </div>
    </div>
  </div>
</nav>
  <!-- Main navigation bar end -->
<style>

</style>