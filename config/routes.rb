Rails.application.routes.draw do
  root 'tickets#index'

  resources :request_api, path: '', only: [:create]
  resources :tickets, path: '', only: [:index, :show]
end
