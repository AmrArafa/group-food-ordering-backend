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
    get 'orders/filter/:created_at', to: 'orders#filter', defaults: {format: :json}
    get 'dashboard', to: 'dashboard#index', defaults: {format: :json}
    get 'mostitem', to: 'dashboard#mostItem', defaults: {format: :json}
    get 'lessitem', to: 'dashboard#lessItem', defaults: {format: :json}
    get 'mostuser', to: 'dashboard#mostUser', defaults: {format: :json}
    get 'lessuser', to: 'dashboard#lessUser', defaults: {format: :json}
    get 'totalsold', to: 'dashboard#totalSold', defaults: {format: :json}
    get 'soldlastmonth', to: 'dashboard#totalSoldLastMonth', defaults: {format: :json}
    get 'soldlastday', to: 'dashboard#totalSoldLastday', defaults: {format: :json}
    get 'soldlasthour', to: 'dashboard#totalSoldLasthours', defaults: {format: :json}
    get '/admins/:invitation_token', to: 'admins#showbytoken', defaults: {format: :json}
    get '/admins/admin/:id', to: 'admins#show', defaults: {format: :json}
    post 'invitations', to: 'invitations#create', defaults: {format: :json}
    post 'registrations/:invitation_token', to: 'registrations#update', defaults: {format: :json}
    post 'login', to: 'sessions#create', defaults: {format: :json}
    get '/', to: 'admin#index', defaults: {format: :json}
    resources :admins, defaults: {format: :json}
    resources :items, defaults: {format: :json}
    resources :groups, defaults: {format: :json}
    resources :orders, defaults: {format: :json}
    resources :users, defaults: {format: :json}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
