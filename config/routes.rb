Rails.application.routes.draw do
  root to: 'interface#index'

  resources :stacks, only: %i(index)
  resources :services, only: %i(index)
  resources :volumes, only: %i(index)
end
