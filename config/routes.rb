Rails.application.routes.draw do
  get 'badges/index'
  get 'badges/new'
  get 'badges/show'
  get 'badges/create'
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  get 'gists/index'
 
  scope "(:locale)", locale: /en|ru|/ do
    root "tests#index"

    get :about, action: :about, controller: 'application'
    get :my_badges, action: :my_badges, controller: 'badges'
    
    resource :contact, only: [:new, :create], controller: 'contact', path_names: { new: '/', create: '/' }

    devise_for :users, path: :students, path_names: { sign_in: :login, sign_out: :logout }
   
    resources :tests, only: :index do
      member do
        post :start
      end
    end

    namespace :admin do
      resources :gists, only: :index
      resources :reward_rules
      resources :badges
      resources :tests do
        resources :questions, shallow: true do
          resources :answers, shallow: true
        end
      end
    end

    # GET /results/1/finish
    resources :results, only: %i[show update] do
      member do
        get   :finish
        post  :gist, as: 'new_gist'
      end
    end
  end

end