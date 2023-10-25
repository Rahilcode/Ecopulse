Rails.application.routes.draw do
  resources :services
  devise_for :companies
  resources :posts
  devise_for :users
  root "home#about"

  get 'home', to: 'home#home'
  get 'about', to: 'home#about'

  get '/user/profile', to: 'home#profile'
  get '/company/profile', to: 'home#company_profile'

end
