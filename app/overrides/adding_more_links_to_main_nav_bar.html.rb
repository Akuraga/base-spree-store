Deface::Override.new(:virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'adding_home_link',
  :insert_before => "li#home-link",
  :text => '<li id="home-page-link" data-hook><a href="/">Home<a/></li>')

Deface::Override.new(:virtual_path => 'spree/shared/_main_nav_bar',
  :name => 'swapping_home_for_shop_link',
  :replace => "li#home-link",
  :text => '<li id="home-link" data-hook><%= link_to "Shop", spree.root_path %></li>')
