module WfsRails
  class Install < Rails::Generators::Base
    def add_routes
      route <<-EOF
        mount WfsRails::Engine => '/'
      EOF
    end
  end
end
