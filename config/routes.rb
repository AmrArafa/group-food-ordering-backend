Rails.application.routes.draw do
  
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
# get 'orderWithoutUser', to: 'orders#orderWithoutUser+'
  
  resources :items, defaults: {format: :json}
  # resources :registrations, only: [:new, :create], defaults: {format: :json}
  post 'signup', to: 'registrations#create', defaults: {format: :json}
  post 'login', to: 'sessions#create', defaults: {format: :json}
  namespace :admin do
    get '/admins/:invitation_token', to: 'admins#showbytoken'
    post 'invitations', to: 'invitations#create'
    post 'registrations/:invitation_token', to: 'registrations#update', defaults: {format: :json}
    post 'login', to: 'sessions#create', defaults: {format: :json}
    get '/', to: 'admin#index'
    resources :admins, defaults: {format: :json}
    resources :items, defaults: {format: :json}
    resources :groups, defaults: {format: :json}
    resources :users, defaults: {format: :json} do
      resources :orders, defaults: {format: :json} do
        resources :order_items, defaults: {format: :json}
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
