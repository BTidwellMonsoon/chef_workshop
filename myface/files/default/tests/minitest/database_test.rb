require File.expand_path('../support/helpers', __FILE__)

describe 'myface::database' do

  include Helpers::Myface

  it 'enables and installs the mysql daemon' do
    service("mysqld").must_be_running
    service("mysqld").must_be_enabled
  end

  it 'seeds the myface database' do
    myface_tables.must_include "users"
  end

end
