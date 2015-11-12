module WfsRails
  class Install < Rails::Generators::Base
    def add_routes
      route <<-EOF
        mount WfsRails::Engine => '/'
      EOF
    end

    def install_migrations
      rake('wfs_rails:install:migrations')
    end
  end
end
