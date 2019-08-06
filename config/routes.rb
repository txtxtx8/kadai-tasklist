Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks
  post 'tasks.new', to: 'tasks#create'
  
  resources :users,only: [:index, :show, :new, :create]
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  
  get 'login' , to: 'sessions#new'
  post 'login' , to: 'sessions#create'
  get 'logout' , to: 'sessions#destroy'
  
  
  
end
