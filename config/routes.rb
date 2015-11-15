WfsRails::Engine.routes.draw do
  get '/:repo/objects/:druid/lifecycle',
      to: 'workflow#lifecycle',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
  get '/:repo/objects/:druid/workflows',
      to: 'workflow#workflows',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
  get '/:repo/objects/:druid/workflows/:workflow',
      to: 'workflow#workflows_by_datastream',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
  put '/:repo/objects/:druid/workflows/:workflow',
      to: 'workflow#create',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
  get '/workflow_archive',
      to: 'workflow#archive',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
end
