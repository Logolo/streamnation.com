<?php
  function is_current($path){
    $name = $_SERVER["SCRIPT_NAME"];
    if ($path == substr($name,strrpos($name,"/")+1)){
      echo "current";
    }
  }
?>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Stream Nation | Your Video Collection Anywhere &amp; Everywhere</title>
  <meta name="description" content="">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="css/style.css">
  <script src="js/vendor/modernizr-2.6.2.min.js"></script>
</head>
<body>
<!--[if lt IE 7]>
  <p class="chromeframe">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p>
<![endif]-->
<header class="site-header">
  <div class="container">
    <a href="index.php" class="header-logo"><img src="img/header.png" alt="Stream Nation"></a>
    <nav class="site-nav">
      <a href="index.php" class="<?php is_current("index.php") ?>">Home</a>
      <a href="features.php" class="<?php is_current("features.php") ?>">Features</a>
      <a href="rights.php" class="<?php is_current("rights.php") ?>">Rights</a>
      <a href="pricing.php" class="<?php is_current("pricing.php") ?>">Pricing</a>
    </nav>
  </div>
</header>