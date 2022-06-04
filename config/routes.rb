Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  root "tests#index"

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
      post :finish
    end
  end

end
