Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  root to: "recruitments#index"
  resources :recruitments, only: [:index, :new, :create, :destroy, :edit, :update]
  resources :users, only: [:index, :show, :edit, :update]
end
