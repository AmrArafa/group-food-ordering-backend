Rails.application.routes.draw do
  resources :notifications

  resources :groups, defaults: {format: :json}
  resources :users, defaults: {format: :json} do
    resources :orders, defaults: {format: :json} do
        resources :order_items, defaults: {format: :json}
    end
  end
  
  resources :users, defaults: {format: :json} do
  	resources :groups, defaults: {format: :json}
  end
  
  resources :orders, defaults: {format: :json}

  resources :charges
  
  resources :items, defaults: {format: :json}

  post 'signup', to: 'registrations#create', defaults: {format: :json}
  post 'login', to: 'sessions#create', defaults: {format: :json}
  namespace :admin do
    get 'dashboard', to: 'dashboard#index'
    get 'mostitem', to: 'dashboard#mostItem'
    get 'lessitem', to: 'dashboard#lessItem'
    get 'mostuser', to: 'dashboard#mostUser'
    get 'lessuser', to: 'dashboard#lessUser'
    get 'totalsold', to: 'dashboard#totalSold'
    get 'soldlastmonth', to: 'dashboard#totalSoldLastMonth'
    get 'soldlastday', to: 'dashboard#totalSoldLastday'
    get 'soldlasthour', to: 'dashboard#totalSoldLasthours'
    get '/admins/:invitation_token', to: 'admins#showbytoken'
    post 'invitations', to: 'invitations#create'
    post 'registrations/:invitation_token', to: 'registrations#update', defaults: {format: :json}
    post 'login', to: 'sessions#create', defaults: {format: :json}
    get '/', to: 'admin#index'
    resources :admins, defaults: {format: :json}
    resources :items, defaults: {format: :json}
    resources :groups, defaults: {format: :json}
    resources :orders, defaults: {format: :json}
    resources :users, defaults: {format: :json}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
