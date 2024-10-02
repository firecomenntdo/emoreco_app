Rails.application.routes.draw do
  devise_for :users
  root 'positives#index'
  resources :positives, :negatives, only: [:index, :create, :show] do
    collection do
      get 'search'
    end
  end
end
