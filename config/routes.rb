Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show]
      resources :measurements, only: [:index, :create]
      resources :measures, only: [:index]
      resources :sessions, only: [:create]
    end
  end
end
