$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'wfs_rails/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'wfs_rails'
  s.version     = WfsRails::VERSION
  s.authors     = ['Jack Reed']
  s.email       = ['pjreed@stanford.edu']
  s.summary     = 'A Rails engine for using/testing Stanford Libraries Workflow Services.'
  s.description = 'A Rails engine for using/testing Stanford Libraries Workflow Services.'
  s.license     = 'Apache'

  s.files = Dir['{app,config,db,lib}/**/*', 'LICENSE.txt', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.add_dependency 'rails', '~> 5.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'engine_cart', '~> 2.0'
  s.add_development_dependency 'rspec-rails', '~> 3.0'
  s.add_development_dependency 'factory_girl_rails'
  s.add_development_dependency 'database_cleaner'
end
