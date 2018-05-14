WfsRails::Engine.routes.draw do
  scope ':repo/objects/:druid', constraints: { druid: %r{[^\/]+} }, defaults: { format: :xml } do
    get 'lifecycle', to: 'workflow#lifecycle'

    resources :workflows, only: [:show, :index, :destroy], controller: 'workflow', param: :workflow do
      collection do
        # Create should be a POST, but this is what the Java WFS app did.
        put ':workflow', to: 'workflow#create'
      end
    end
  end

  get '/workflow_archive',
      to: 'workflow#archive',
      constraints: { druid: %r{[^\/]+} },
      defaults: { format: :xml }
end
