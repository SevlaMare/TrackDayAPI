Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :users, only: [:create, :show, :index]

      resources :measurements, only: [:index, :create]
      resources :measures, only: [:index]
    end
  end
end
