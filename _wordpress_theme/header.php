<?php
/**
 * @package WordPress
 * @subpackage streamnation
 */
?><!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
  
  <title><?php wp_title('|', true, 'right'); ?> <?php bloginfo('name'); ?> Blog</title>

  <link type="text/css" href="<?php bloginfo('stylesheet_directory'); ?>/style.css" rel="stylesheet" media="screen" />
  <link type="text/css" href="http://localhost/ocupop/streamnation/css/style.css" rel="stylesheet" media="screen" />

  <!-- Modernizr -->
  <script src="<?php bloginfo('template_url'); ?>/js/vendor/modernizr-2.6.2.min.js"></script>

  <?php wp_head(); ?>
</head>
<body <?php body_class('blog'); ?>>
  <!--[if lt IE 7]><p class="chromeframe">You are using an outdated browser. <a href="http://browsehappy.com/">Upgrade your browser today</a> or <a href="http://www.google.com/chromeframe/?redirect=true">install Google Chrome Frame</a> to better experience this site.</p><![endif]-->

  <header class="site-header">
    <div class="container">
      <a href="index.php" class="header-logo"><img src="<?php bloginfo('template_url'); ?>/img/header_beta.png" alt="Stream Nation"></a>
      <nav class="site-nav" role="navigation">
        <?php wp_nav_menu(array('theme_location' => 'navigation')); ?>
      </nav>
      <a href="#" class="login">Log in</a>
    </div>
  </header>

  <section class="blog-content">
    <div class="container">
      <aside>
        <header>
          <h1><a href="<?php bloginfo('url'); ?>">Blog</a></h1>
          <p></p> <!-- Please leave this blank paragraph here. -->
          <?php get_sidebar('Blog Sidebar'); ?>
        </header>
      </aside>

      <article>