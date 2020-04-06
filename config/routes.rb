Rails.application.routes.draw do
  get 'maps/index'
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'

  resources :maps, only: [:index]
end
