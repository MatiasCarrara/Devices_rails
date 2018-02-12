Rails.application.routes.draw do
  get 'devices/index'

  resources :devices

  root 'devices#index'
end
