Rails.application.routes.draw do
  get 'picture_details/new'
  get 'picture_details/create'
  get 'picture_detail/new'
  get 'picture_detail/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
    
  resources :users
  
  resources :posts, except: [:index]
  
  resources :picture_details, only: [:index, :new, :create]

end
