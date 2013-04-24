require File.expand_path('../support/helpers', __FILE__)
require File.expand_path('../../apache2/support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface
  include Helpers::Apache

  # Example spec tests can be found at http://git.io/Fahwsw
  it 'creates a service account for the myface daemon' do
    user("myface").must_exist
  end

  it 'enables and installs the mysql daemon' do
    service("mysqld").must_be_running
    service("mysqld").must_be_enabled
  end

  it 'seeds the myface database' do
    myface_tables.must_include "users"
  end

  it 'enables and starts the httpd daemon' do
    service("httpd").must_be_running
    service("httpd").must_be_enabled
  end

  it 'enables mod_php5' do
    apache_enabled_modules.must_include "php5_module"
  end

  it 'configures apache for myface' do
    link("#{node['apache']['dir']}/sites-enabled/myface.conf")
    .must_exist.with(:link_type, :symbolic)
    .and(:to, "#{node['apache']['dir']}/sites-available/myface.conf")
  end

end
