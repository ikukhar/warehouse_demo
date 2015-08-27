Rails.application.routes.draw do

  root to: "warehouses#index" 

  resources :warehouses do
    resources :sectors, only: [:new, :create]
  end

  resources :sectors, only: [:show, :edit, :update, :destroy] do
    resources :cells, only: [:new, :create]
  end

  resources :cells, only: [:show, :edit, :update, :destroy] do
    resources :items, only: [:new, :create]
  end

  resources :items

end
