Rails.application.routes.draw do
  get 'welcome/index'

  resources :devices

  root 'welcome#index'
end
