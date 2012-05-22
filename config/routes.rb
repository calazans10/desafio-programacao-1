Desafio::Application.routes.draw do
  devise_for :users

  root :to => 'site#index'

  resources :orders, :only => [:new] do
    collection do
      post :upload
    end
  end
end
