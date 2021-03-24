Rails.application.routes.draw do
  devise_for :users
  resources :portfolios
  #get 'home/index'

  root 'home#index' #Required for DEVISE CONFIG (copied from bundle install output for devise): "Ensure you have defined root_url to *something* in your config/routes.rb. For example: root to: "home#index" * Not required for API-only Applications *"

  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
