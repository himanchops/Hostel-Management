Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  # get 'tenants/new', to: 'hostel_entry#new'
  resources :tenants, :as => 'users' do
  	resources :hostel_entries
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
