Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :posts
#  root 'posts#index'
  
  root :to => redirect('/posts')
  
end
