require 'rubygems'
$LOAD_PATH << File.join(File.dirname(__FILE__), *%w[.. vendor ginger lib])
require 'ginger'
require 'column_timestamps'
require 'spec'
require 'spec/autorun'

ActiveRecord::Base.establish_connection({ :database => ":memory:", :adapter => 'sqlite3', :timeout => 500 })
require 'fixtures/schema.rb'
require 'fixtures/models.rb'

Spec::Runner.configure do |config|
end
