Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, skip: [ :registrations ]

  devise_scope :user do
    authenticated :user do
      root 'devices#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :devices, :users, :licenses, :people, :locations

  resources :reports, only: [:index] do
    collection do
      get :location_inventory
      get :device_aging
    end
  end
end
