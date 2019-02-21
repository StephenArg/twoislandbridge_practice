Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  resources :users

  post 'user/login', to: 'users#login'
  post 'user/authenticate', to: 'users#authenticate'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
