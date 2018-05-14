WfsRails::Engine.routes.draw do
  scope ':repo/objects/:druid', constraints: { druid: %r{[^\/]+} }, defaults: { format: :xml } do
    get 'lifecycle', to: 'workflow#lifecycle'
    get 'workflows', to: 'workflow#workflows'
    get 'workflows/:workflow', to: 'workflow#workflows_by_datastream'
    put 'workflows/:workflow', to: 'workflow#create'
  end

  get '/workflow_archive',
      to: 'workflow#archive',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
end
