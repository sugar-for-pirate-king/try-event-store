Rails.application.routes.draw do
  namespace :api do
    resources :users, only: %i[create show]
    
    scope :users, module: :users do
      resources :activations
    end
  end
end
