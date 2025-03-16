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

  resources :users, :licenses

  resources :locations do
    get 'send_inventory_email', on: :member
    get 'send_inventory_emails', on: :collection
  end

  resources :people do
    get 'send_inventory_email', on: :member
    get 'send_inventory_emails', on: :collection
  end

  resources :devices do
    get 'asset_label', on: :member
  end
end
