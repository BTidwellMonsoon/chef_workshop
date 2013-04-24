#
# Cookbook Name:: myface
# Recipe:: database
#
# Copyright (C) 2013 Blake Tidwell
# 
# All rights reserved - Do Not Redistribute
#
application_name = "myface"
doc_root = "/srv/apache/#{application_name}"

node.default['apache']['default_site_enabled'] = false

include_recipe "apache2"
include_recipe "apache2::mod_php5"

package "php-mysql" do
  action :install
  notifies :restart, "service[apache2]"
end

# Enable MyFace website
template "#{node['apache']['dir']}/sites-available/myface.conf" do
  source "apache2.conf.erb"
  notifies :restart, 'service[apache2]'
end

apache_site "#{application_name}.conf" do
  enable true
  notifies :restart, 'service[apache2]'
end

directory doc_root do
  action :create
  mode 0755
  recursive true
end

template "#{doc_root}/index.php" do
  source "index.php.erb"
  mode 0644
end
