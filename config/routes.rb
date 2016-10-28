Rails.application.routes.draw do
  resources :officers
  resources :cars
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',   to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get  '/reportofficer', to: 'officers#new'
  post '/reportofficer',  to: 'officers#create'
  get  '/locateYourCar', to: 'cars#new'
  post '/locateYourCar',  to: 'cars#create'
  resources :users
end
