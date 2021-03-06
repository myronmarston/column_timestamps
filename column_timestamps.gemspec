# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{column_timestamps}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Myron Marston"]
  s.date = %q{2010-03-25}
  s.description = %q{Works "automagically" like updated_at...just add a column named <column>_updated_at, and when your column changes, the timestamp will be updated. }
  s.email = %q{myron.marston@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "column_timestamps.gemspec",
     "ginger_scenarios.rb",
     "lib/column_timestamps.rb",
     "spec/fixtures/models.rb",
     "spec/fixtures/schema.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/user_spec.rb"
  ]
  s.homepage = %q{http://github.com/myronmarston/column_timestamps}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Keeps track of when a specific column in an ActiveRecord model changed.}
  s.test_files = [
    "spec/fixtures/models.rb",
     "spec/fixtures/schema.rb",
     "spec/spec_helper.rb",
     "spec/user_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activerecord>, [">= 2.1.0"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<activerecord>, [">= 2.1.0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<activerecord>, [">= 2.1.0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 1.2.5"])
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end

