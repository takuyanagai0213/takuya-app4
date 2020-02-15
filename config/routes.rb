Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
    
  resources :users
  
  resources :posts, except: [:index] do
    resources :comments, only: [:create]
  end
  resources :picture_details, only: [:index, :new, :create]
end