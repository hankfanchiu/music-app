Rails.application.routes.draw do
  root to: 'sessions#new'

  resource :user, only: [:new, :create, :show] do
    get '/activate', to: 'users#activate'
  end

  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resource :albums, only: :new
  end

  resources :albums, except: :index do
    resource :tracks, only: :new
  end

  resources :tracks, except: :index

  resources :notes, except: [:index, :show]
end
