Rails.application.routes.draw do

  root to: "warehouses#index" 

  resources :warehouses
  resources :sectors
  resources :cells
  resources :items

end
