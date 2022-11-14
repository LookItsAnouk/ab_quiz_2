Rails.application.routes.draw do
  root "ideas#index"

  resources :ideas do 
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create, :edit, :update]

  resource :session, only: [:new, :destroy, :create]

end
