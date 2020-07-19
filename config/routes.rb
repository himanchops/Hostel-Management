Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :tenants, :as => 'users' do 
  	resources :hostel_entries do
  		resources :rent_entries
  	end
  end

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
