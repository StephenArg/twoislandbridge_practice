Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :users
  resources :conversations
  resources :messages

  post 'user/login', to: 'users#login'
  post 'user/authenticate', to: 'users#authenticate'
  post 'conversation/search', to: 'conversations#find_open_room'
  post 'conversation/reopen', to: 'conversations#reopen'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
