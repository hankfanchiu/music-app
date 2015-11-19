Rails.application.routes.draw do
  root to: 'bands#index'

  resource :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  resource :bands do
  end
end
