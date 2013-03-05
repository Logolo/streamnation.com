<?php
/**
 * @package WordPress
 * @subpackage streamnation
 */

get_header();

if ( have_posts() ) while ( have_posts() ) : the_post();

  print('
  <div class="post">
    <header>
      <h2>' . get_the_title() . '</h2>
      <p class="date">' . get_the_date('l, F j, Y') . '</p>
    </header>
    <div class="post_body">');

      the_content();

  print('
    </div>
  </div>
  ');
?>

<div class="blog-navigation">
  <div class="nav-previous"><?php previous_post_link(); ?>&nbsp;</div>
  <div class="nav-next">&nbsp;<?php next_post_link(); ?></div>
</div>

<?php

endwhile;

get_footer();

?>