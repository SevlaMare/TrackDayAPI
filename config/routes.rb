Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :show, :new, :create]
      resources :measurements, only: [:index, :show, :new, :create]
    end
  end
end
