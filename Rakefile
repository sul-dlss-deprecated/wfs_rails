begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

Bundler::GemHelper.install_tasks

task default: [:ci]

require 'engine_cart/rake_task'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

desc 'Run test suite'
task ci: ['wfs_rails:generate'] do
  Rake::Task['wfs_rails:coverage'].invoke
end

namespace :wfs_rails do
  desc 'Run tests with coverage'
  task :coverage do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec'].invoke
  end

  desc 'Create the test rails app'
  task generate: ['engine_cart:generate'] do
  end
end
