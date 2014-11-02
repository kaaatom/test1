Spree::Core::Engine.routes.draw do

  namespace :admin do
    resources :products do
      resources :downloadables
    end
  end

  resources :downloadables, only: [:show]

  # Add your extension routes here
end
