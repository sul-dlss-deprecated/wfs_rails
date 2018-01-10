## WFS Rails
[![Build Status](https://travis-ci.org/sul-dlss/wfs_rails.svg)](https://travis-ci.org/sul-dlss/wfs_rails)

WFS Rails is a Rails engine for testing and development with Stanford's DOR Worklow Services.

The Rails engine stubs several of the most frequently
used Workflow Services routes (but not all of them). See `config/routes.rb` for implemented routes. It is booted using
[Capybara::Discoball](https://github.com/thoughtbot/capybara_discoball) and
expects to use your application's Rails database as storage for Workflow Service data. The advantage of using WFS Rails is that you don't need
to access any external Workflow APIs during development or testing (this is especially useful when building on Travis).

To set up and use WFS Rails in your project, take a look at this Argo pull request:

https://github.com/sul-dlss/argo/pull/317/files

