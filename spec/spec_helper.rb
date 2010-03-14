require 'rubygems'
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'column_timestamps'
require 'spec'
require 'spec/autorun'

ActiveRecord::Base.establish_connection({ :database => ":memory:", :adapter => 'sqlite3', :timeout => 500 })
require 'fixtures/schema.rb'
require 'fixtures/models.rb'

Spec::Runner.configure do |config|
end
