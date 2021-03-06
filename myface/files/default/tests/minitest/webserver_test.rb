require File.expand_path('../support/helpers', __FILE__)
require File.expand_path('../../apache2/support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface
  include Helpers::Apache

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

  it 'deploys the myface index page' do
    directory("/srv/apache/myface")
      .must_have(:mode, "755")
      .with(:owner, "root")
      .and(:group, "root")
    file("/srv/apache/myface/index.php")
      .must_have(:mode, "644")
      .with(:owner, "root")
      .and(:group, "root")  
  end
  
  it 'installs php-mysql' do
    package("php-mysql").must_be_installed
  end  

end
