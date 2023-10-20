Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root "home#about"

  get 'home', to: 'home#home'
  get 'about', to: 'home#about'

  get '/user/profile', to: 'home#profile'

end
