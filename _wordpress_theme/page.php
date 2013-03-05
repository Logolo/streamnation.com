<?php
/**
 * @package WordPress
 * @subpackage streamnation
 */

get_header();
?>

<?php if (have_posts()) : ?>
  <?php while (have_posts()) : the_post(); ?>
      <h2><?php the_title(); ?></h2>
      <?php the_content(); ?>
    <?php } ?>
  <?php endwhile; ?>
<?php endif; ?>

<?php get_footer(); ?>
