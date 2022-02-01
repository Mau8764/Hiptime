Rails.application.routes.draw do
  root "items#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :items do
    member do
      get "complete"
    end
  end
end
