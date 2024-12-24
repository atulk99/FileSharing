Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  root "file_uploads#index" # Replace with your home controllers

  # Defines the root path route ("/")
  # root "posts#index"
  get 'files/:public_token', to: 'file_uploads#public_show', as: :public_file
  # get 'public/:public_token', to: 'file_uploads#public_show', as: 'public_file'

  # resources :file_uploads
  resources :file_uploads
end
