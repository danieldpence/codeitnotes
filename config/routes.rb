Rails.application.routes.draw do
  devise_for :users
  resources :notes
  resources :tags
  
  root 'notes#index'
end
