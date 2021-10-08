Rails.application.routes.draw do
  devise_for :users
  
  root to: "items#index"
  resources :items  do
    resources :get_users, only: [:index, :create, :new]
  end 

end
