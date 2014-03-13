ApiLogin::Application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :api, only: :index do
    collection do
      post :register
      post :login
    end
  end
end
