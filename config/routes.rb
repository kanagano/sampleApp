Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'login' => 'users#login_form'
  post 'login' => 'users#login'
  post 'logout' => 'users#logout'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'

  get 'museums' => 'museums#index'
  get 'museums/search' => 'museums#search'
  get 'museums/:id' => 'museums#show'

  get 'posts/:museum_id/new' => 'posts#new'
  post 'posts/:museum_id/create' => 'posts#create'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'

  post 'likes/:post_id/create' => 'likes#create'
  post 'likes/:post_id/destroy' => 'likes#destroy'

  post 'favorites/:museum_id/create' => 'favorites#create'
  post 'favorites/:museum_id/destroy' => 'favorites#destroy
  '

  resources :maps, only: [:index]
end
