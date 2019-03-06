Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

namespace :api do
  resources :users
  resources :conversations
  resources :messages

  post 'user/login', to: 'users#login'
  post 'user/authenticate', to: 'users#authenticate'
  post 'conversation/search', to: 'conversations#find_open_room'
  post 'conversation/reopen', to: 'conversations#reopen'
  get 'connections/:id', to: 'conversations#connections'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
