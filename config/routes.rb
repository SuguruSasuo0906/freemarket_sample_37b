Rails.application.routes.draw do
  devise_for :users, :controllers => {
   registrations: 'users/registrations',
   omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get 'users' => 'users/registrations#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :users, only: [:show, :update] do
    member do
      get 'logout'
      get 'profile'
      get 'identification'
    end
    resources :addresses, only: [:new, :create, :edit, :update]
    resources :payments, only: [:new, :create, :edit]
    resources :items, only: [:new, :create, :show] do
      resources :deliveries
      resources :deals, only: [:new]
    end
  end
end
