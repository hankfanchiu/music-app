Rails.application.routes.draw do
  root to: 'bands#index'

  resource :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resource :albums, only: :new
  end

  resources :albums, except: :index do
    resource :tracks, only: :new
  end

  resources :tracks, except: :index
end
