Rails.application.routes.draw do
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")

  get 'gists/index'
 
  scope "(:locale)", locale: /en|ru|/ do
    root "tests#index"

    get :about, action: :about, controller: 'application'
    # get :contact, action: :contact, controller: 'application'
    # post :contact, action: :send_contact, controller: 'application'

    resource :contact, only: [:new, :create], controller: 'contact', path_names: { new: '/', create: '/' }

    devise_for :users, path: :students, path_names: { sign_in: :login, sign_out: :logout }
   
    resources :tests, only: :index do
      member do
        post :start
      end
    end

    namespace :admin do
      resources :gists, only: :index
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