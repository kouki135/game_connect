Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "recruitments#index"
  resources :recruitments do
    collection do
      get 'search'
    end
      resources :comments, only: :create
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :rooms, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
