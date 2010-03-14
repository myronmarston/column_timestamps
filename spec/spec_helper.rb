require 'rubygems'
gem 'activerecord', '>= 2.1.0', '< 3.0.0.beta'
require 'column_timestamps'
require 'spec'
require 'spec/autorun'

ActiveRecord::Base.establish_connection({ :database => ":memory:", :adapter => 'sqlite3', :timeout => 500 })
require 'fixtures/schema.rb'
require 'fixtures/models.rb'

Spec::Runner.configure do |config|
end
