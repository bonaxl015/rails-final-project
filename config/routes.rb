Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'static#home'
  get 'static/home'
  devise_for :users

  devise_scope :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
    get 'users/:id/profile' => 'devise#profile', as: 'profile'
    get 'users/:id/relationships' => 'devise#relationships', as: 'relations'
  end

  resources :dashboard, only: %i[news_feed create_post] do
    collection do
      get :news_feed
      post :create_post
    end
  end

  resources :events do
    collection do
      get :all
    end

    resources :attends, only: %i[create destroy]
  end

  resources :relationships, only: %i[create destroy]
end
