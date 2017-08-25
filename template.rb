gem "wfs_rails"

run "bundle install"

generate 'wfs_rails:install'

# run the database migrations
rake "db:migrate"
