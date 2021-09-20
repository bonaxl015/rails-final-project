Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'static#home'
  get 'static/home'
  devise_for :users

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'users/:id/profile' => 'devise#profile', as: 'profile'
  end

  resources :posts, except: %i[show new] do
    resources :comments, only: %i[create destroy]
    resources :likes, only: %i[create destroy]
  end

  resources :events do
    collection do
      get :all
    end

    resources :attends, only: %i[create destroy]
  end

  resources :relationships, only: %i[create destroy]

  resources :space_news, only: %i[index] do
    collection do
      get :search
    end
  end
end
