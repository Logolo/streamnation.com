<?php

// Timezone.
date_default_timezone_set('America/Los_Angeles');

// RSS feed links.
automatic_feed_links();

// Navigation menus.
add_theme_support('menus');
function register_my_menus() { register_nav_menus(array('navigation' => 'Navigation')); }
add_action( 'init', 'register_my_menus' );

// Sidebar widgets.
register_sidebar(array(
    'name' => 'Blog Sidebar',
    'before_widget' => '<div id="%1$s" class="sidebar_widget %2$s">',
    'after_widget' => '</div>',
    'before_title' => '<h3>',
    'after_title' => '</h3>',
) );

// Enable more buttons in TinyMCE editor.
function enable_more_buttons($buttons) {
  $buttons[] = 'hr';
  $buttons[] = 'sub';
  $buttons[] = 'sup';
  return $buttons;
}
add_filter("mce_buttons", "enable_more_buttons");

// Increase default upload size.
ini_set('upload_max_size' , '64M' );
ini_set('post_max_size', '64M');
ini_set('max_execution_time', '300');

// Always show the 'kitchen sink' in the TinyMCE editor.
function unhide_kitchensink( $args ) {
 $args['wordpress_adv_hidden'] = false;
 return $args;
}
add_filter( 'tiny_mce_before_init', 'unhide_kitchensink' );

// Add page slug as nav IDs.
function nav_id_filter( $id, $item ) {
  return 'nav-'.sanitize_title($item->title);
}
add_filter( 'nav_menu_item_id', 'nav_id_filter', 10, 2 );

// Add page slug as body class. Also include the page parent.
function my_body_classes($classes, $class='') {
  global $wp_query;

  $post_id = $wp_query->post->ID;

  if (is_page($post_id )) {
    $page = get_page($post_id);
    
    if ($page->post_parent>0) {
      $parent = get_page($page->post_parent);
      $classes[] = 'page-' . sanitize_title($parent->post_title);
    }

    $classes[] = 'page-' . sanitize_title($page->post_title);
  }

  return $classes;
}
add_filter('body_class','my_body_classes');

?>