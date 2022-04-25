Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :vegetables
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :garden_types, except: [:destroy, :show]
  get 'sort_az', to: 'vegetables#sort_az'
  get 'sort_za', to: 'vegetables#sort_za'
end
