Rails.application.routes.draw do
  devise_for :users
  root 'positives#index'
  resources :positives, only: :index

end
