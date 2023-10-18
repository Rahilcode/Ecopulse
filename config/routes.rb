Rails.application.routes.draw do
  devise_for :users
  root "home#home"

  get 'home', to: 'home#home'
  get 'about', to: 'home#about'

  get '/user/profile', to: 'home#profile'

end
