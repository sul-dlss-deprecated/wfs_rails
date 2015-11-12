$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "wfs_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "wfs_rails"
  s.version     = WfsRails::VERSION
  s.authors     = [""]
  s.email       = ["pjreed@stanford.edu"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of WfsRails."
  s.description = "TODO: Description of WfsRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'engine_cart', '~> 0.8'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
end
