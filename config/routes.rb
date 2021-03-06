Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  
  resources :tasks
  
  resources :users,only: [:new, :create]
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  get 'logout' , to: 'sessions#destroy'
  
  
  
end
