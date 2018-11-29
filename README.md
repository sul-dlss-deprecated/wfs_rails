## WFS Rails
[![Build Status](https://travis-ci.org/sul-dlss/wfs_rails.svg)](https://travis-ci.org/sul-dlss/wfs_rails)

WFS Rails is a Rails engine for testing and development with Stanford's DOR Worklow Services.

The Rails engine stubs several of the most frequently
used Workflow Services routes (but not all of them). See `config/routes.rb` for implemented routes.

### Installing
Add to `Gemfile`
```ruby
gem 'wfs_rails'
```
Then `bundle install`

Next add this to `config/routes.rb`:
```ruby
Rails.application.routes.draw do
  mount WfsRails::Engine => '/'
end
```

Finally run:
```
rake wfs_rails:install:migrations
```


### Alternative install
You may choose to use
[Capybara::Discoball](https://github.com/thoughtbot/capybara_discoball) which 
expects to use your application's Rails database as storage for Workflow Service data. The advantage of using WFS Rails is that you don't need
to access any external Workflow APIs during development or testing (this is especially useful when building on Travis).

To set up and use WFS Rails in your project, take a look at this Argo pull request:

https://github.com/sul-dlss/argo/pull/317/files

Or this stanalone server:

https://github.com/sul-dlss-labs/workflow-server-rails/
