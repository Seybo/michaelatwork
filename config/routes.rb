Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts
#  root 'posts#index'
  
  root :to => redirect('/posts')
  
end
