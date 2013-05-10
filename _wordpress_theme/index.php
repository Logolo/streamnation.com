<?php
/**
 * @package WordPress
 * @subpackage streamnation
 */

get_header();

$blog_posts = get_posts(array('numberposts' => '-1', 'post_type' => 'post', 'post_status' => 'publish'));

foreach ($blog_posts as $post) {
  setup_postdata($post);

  print('
  <div class="post">
    <header>
      <h2><a href="' . get_permalink() . '">' . get_the_title() . '</a></h2>
      <p class="date">' . get_the_date('l, F j, Y') . '</p>
    </header>
    <div class="post_body">');

      the_content();

  print('
    </div>
  </div>
  ');
}

get_footer();

?>