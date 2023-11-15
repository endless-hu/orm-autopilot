Rails.application.routes.draw do
  # Users routes
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'

  # Sessions routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'orms', to: 'orms#redirect_to_user_orms'
  get 'orms/new', to: 'orms#redirect_to_user_orms_new'

  # ORMs routes
  resources :orms do
    collection do
      get :update_page
      get :history
    end
  end

  resources :users do
    resources :orms
  end

  # Root route
  root to: redirect('/orms')
end
