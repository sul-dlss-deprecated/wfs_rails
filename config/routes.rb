WfsRails::Engine.routes.draw do
  get '/:repo/objects/:druid/lifecycle', to: 'workflow#lifecycle', constraints: { druid: /[^\/]+/ }, defaults: { format: :xml }
  get '/:repo/objects/:druid/workflows', to: 'workflow#workflows', constraints: { druid: /[^\/]+/ }, defaults: { format: :xml }
  get '/:repo/objects/:druid/workflows/:workflow', to: 'workflow#workflows_by_datastream', constraints: { druid: /[^\/]+/ }, defaults: { format: :xml }
end
