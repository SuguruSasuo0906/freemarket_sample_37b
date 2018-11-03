Rails.application.routes.draw do
  devise_for :users, :controllers => {
   registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users' => 'users/registrations#index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  resources :items, only: [:index, :new, :show]
  resources :users, only: [:show ,:logout]
end
