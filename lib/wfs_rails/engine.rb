module WfsRails
  class Engine < ::Rails::Engine
    isolate_namespace WfsRails

    require 'jbuilder'
    require 'wfs_rails/workflow_parser'
    require 'wfs_rails/process_parser'

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s
        config.paths['db/migrate'].expanded.each do |expanded_path|
          app.config.paths['db/migrate'] << expanded_path
        end
      end
    end
  end
end
