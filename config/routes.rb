Rails.application.routes.draw do
  root "ideas#index"

  resources :ideas do 
    resources :reviews, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resource :session, only: [:new, :destroy, :create]

end
