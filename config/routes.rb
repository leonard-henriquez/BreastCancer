Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'detection#index'

  resources :detections
  post '/detections/:id', to: 'detections#check', as: 'check'
end
