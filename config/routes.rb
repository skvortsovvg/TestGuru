Rails.application.routes.draw do
  resources :answers
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "tests#index"

  resources :tests do
    resources :questions, shallow: true
  end
end
