WfsRails::Engine.routes.draw do
  get '/:repo/objects/:druid/lifecyle', to: 'workflow#lifecycle'
end
