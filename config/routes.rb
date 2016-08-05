Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :posts

  root to: 'high_voltage/pages#show', id: 'home'
  get 'development' => 'high_voltage/pages#show', id: 'development'
  get 'design' => 'high_voltage/pages#show', id: 'design'
  get 'contact' => 'high_voltage/pages#show', id: 'contact'

  # get '/projects/:page' => 'projects#show'
end
