$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wfs_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wfs_rails"
  s.version     = WfsRails::VERSION
  s.authors     = [""]
  s.email       = ["pjreed@stanford.edu"]
  s.summary     = "Summary of WfsRails."
  s.description = "Description of WfsRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'engine_cart', '~> 0.8'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
end
