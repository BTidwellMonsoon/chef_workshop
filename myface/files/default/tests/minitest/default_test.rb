require File.expand_path('../support/helpers', __FILE__)

describe 'myface::default' do

  include Helpers::Myface

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

end
