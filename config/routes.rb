Rails.application.routes.draw do
  resources :labels, only: [:show]


    resources :topics do
        # #34
        resources :posts, except: [:index]
        resources :comments, only: [:create, :destroy]
    end

    resources :posts, only: [] do
# #5
   resources :comments, only: [:create, :destroy]
 end
    resources :users, only: [:new, :create]

    resources :sessions, only: [:new, :create, :destroy]
    get 'about' => 'welcome#about'

    root 'welcome#index'
end
