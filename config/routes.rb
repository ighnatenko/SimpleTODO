Rails.application.routes.draw do
  devise_for :users
  resources :projects, only: [:index, :create, :update, :destroy] do
    resources :tasks, only: [:create, :update, :destroy] do
      collection { post :sort }
    end
  end

  root "projects#index"
end
