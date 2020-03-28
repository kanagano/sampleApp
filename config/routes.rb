Rails.application.routes.draw do
  get 'signup' => 'users#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'
end
