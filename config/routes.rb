Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "tests#index"

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'

  resources :users, only: :create
  resource :session, only: %i[new create destroy]

  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end

    member do
      post :start
    end
  end

  # GET /results/1/finish
  resources :results, only: %i[show update] do
    member do
      get :finish
    end
  end
end
