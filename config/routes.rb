Rails.application.routes.draw do
  get 'gists/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  scope "(:locale)", locale: /en|ru|/ do
    root "tests#index"

    get :about, action: :about, controller: 'application'

    devise_for :users, path: :students, path_names: { sign_in: :login, sign_out: :logout }
    # devise_for :users, controllers: { sessions: 'users/sessions' }      

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

# client = Octokit::Client.new(:access_token => "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")
# client.post('/gists', {
#   description: 'Example of a gist',
#   'public': false,
#   files: {
#   'README.md': {
#     content: 'Hello World'
#     } 
#   }
# })
