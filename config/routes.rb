Rails.application.routes.draw do
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/show'
  get 'posts/edit'
  get 'posts/update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
    
  resources :users
  
  resources :posts, only: [:new, :show, :edit, :update, :create, :destroy]

end
