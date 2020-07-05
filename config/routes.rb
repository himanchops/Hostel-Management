Rails.application.routes.draw do
  get 'tenant/show'
  devise_for :users
  root 'home#index'
  resources :tenant
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
