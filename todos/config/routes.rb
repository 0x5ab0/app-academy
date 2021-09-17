Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    resources :todos, only: [:index, :show, :create, :update, :destroy]
  end
end
