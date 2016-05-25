Rails.application.routes.draw do

  # get 'question/index'
  #
  # get 'question/show'
  #
  # get 'question/new'
  #
  # get 'question/create'
  resources :questions

   resources :posts
   get 'about' => 'welcome#about'

  root 'welcome#index'
end
