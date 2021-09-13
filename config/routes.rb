Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'events/all'

  root to: 'static#home'
  get 'static/home'
  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  resources :dashboard do
    collection do
      get :news_feed
      get :profile
      post :create_post
    end
  end

  resources :events do
    resources :attends
  end
end
