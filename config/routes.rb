Rails.application.routes.draw do
  resources :time_zone, only: [:index]
end
