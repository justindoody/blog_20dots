Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :images, only: [:create, :destroy]
    member do
      get :publish, :unpublish
    end

    get :admin, on: :collection
  end

  resources :sessions, only: :none, path: '' do
    collection do
      get :logout
      post :login
      get :admin, action: :new
    end
  end

  get :feed, to: "feed#data", as: "feed", defaults: { format: 'atom' }
end
