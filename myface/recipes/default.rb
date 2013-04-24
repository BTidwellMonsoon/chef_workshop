#
# Cookbook Name:: myface
# Recipe:: default
#
# Copyright (C) 2013 Blake Tidwell
# 
# All rights reserved - Do Not Redistribute
#
application_name = "myface"
doc_root = "/srv/apache/#{application_name}"

user application_name

include_recipe "mysql::server"
# Include the mysql Ruby bindings for Chef
include_recipe "mysql::ruby"

# Create mysql connection binding
mysql_connection_info = {:host => "localhost",
                         :username => 'root',
                         :password => node['mysql']['server_root_password']}

# Metadata dependency on the database cookbook provides
# access to the mysql_database provider.
mysql_database application_name do
  connection mysql_connection_info
    action :create
end

# Write schema seed file to filesystem
cookbook_file "/tmp/myface-init.sql" do
    source "myface-init.sql"
    owner "root"
    group "root"
    mode "0644"
end

# # Seed the database with test data
execute "initialize myface database" do
  command "mysql -h localhost -u root -p#{node['mysql']['server_root_password']} -D myface < /tmp/myface-init.sql"
  not_if "mysql -h localhost -u root -p#{node['mysql']['server_root_password']} -D myface -e 'describe users;'"
end

###################################
# Make teh web servr
###################################

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
