require 'ginger'

def create_scenario(version)
  scenario = Ginger::Scenario.new("Rails #{version}")
  scenario[/^active_?record$/] = version
  scenario[/^active_?support$/] = version
  scenario
end
 
Ginger.configure do |config|
  config.aliases["active_record"] = "activerecord"
  config.aliases["active_support"] = "activesupport"

  versions = []

  versions << '3.0.0.beta' unless RUBY_VERSION == '1.8.6'
  versions += %w( 2.3.5 2.3.4 2.3.3 2.3.2 )
  versions += %w( 2.2.3 2.2.2 2.1.2 2.1.1 2.1.0 ) if RUBY_VERSION =~ /^1\.8/

  versions.each do |version|
    config.scenarios << create_scenario(version)
  end
end