WfsRails::Engine.routes.draw do
  scope ':repo/objects/:druid', constraints: { druid: %r{[^\/]+} }, defaults: { format: :xml } do
    resources :workflows, only: [:show, :index], controller: 'workflow' do
      collection do
        get 'lifecycle'
        put ':workflow', to: 'workflow#create'
      end
    end
  end

  get '/workflow_archive',
      to: 'workflow#archive',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
end
