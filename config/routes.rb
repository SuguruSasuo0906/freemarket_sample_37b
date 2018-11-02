Rails.application.routes.draw do
  devise_for :users, :controllers => {
   registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users' => 'users/registrations#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :users, only: [:show] do
    member do
      get 'logout'
    end
  end
end
