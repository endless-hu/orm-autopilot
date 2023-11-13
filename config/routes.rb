Rails.application.routes.draw do
  # Users routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Sessions routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # ORMs routes
  resources :orms do
    collection do
      get :update_page
      get :history
    end
  end

  # Root route
  root to: redirect('/orms')
end
