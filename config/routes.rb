Rails.application.routes.draw do
  resources :orms do
    collection do
      get :update_page
      get :history
    end
  end

  root :to => redirect('/orms')

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  # Defines the root path route ("/")
  # root "posts#index"
end
