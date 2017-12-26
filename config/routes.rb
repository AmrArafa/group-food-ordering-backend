Rails.application.routes.draw do
  
  resources :groups, defaults: {format: :json}
  resources :users, defaults: {format: :json} do
    resources :orders, defaults: {format: :json} do
        resources :order_items, defaults: {format: :json}
    end
  end
  
  resources :items, defaults: {format: :json}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
