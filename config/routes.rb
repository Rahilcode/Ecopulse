Rails.application.routes.draw do
  resources :services do 
    resources :ratings, only: [:new, :create]
    resources :orders, only: [:new, :create, :show]
  end

  devise_for :companies
  resources :posts
  devise_for :users
  root "home#about"

  get 'home', to: 'home#home'
  get 'about', to: 'home#about'

  get '/user/profile', to: 'home#profile'
  get '/company/profile', to: 'home#company_profile'
  get '/user/services', to: 'home#services'

  get '/services/search', to: 'home#search'

  get '/user/services/search', to: 'home#filter'
  get '/company/services/search', to: 'services#filter'

  get '/company/posts', to: 'home#posts'

  get '/notification', to: 'home#notification'

  # get '/services/:service_id/payment', to: 'orders#payment', as: :payment
  # get '/pay', to: 'orders#pay'

  

end
