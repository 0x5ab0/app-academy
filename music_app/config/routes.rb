Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:show, :new, :create]
  
  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: [:show, :create, :edit, :update, :destroy]
end
