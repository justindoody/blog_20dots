Rails.application.routes.draw do
  root 'posts#index'

  resources :posts do
    resources :images, only: [:create, :destroy]
    member do
      get :publish, :unpublish
    end
  end
  get 'admin' => 'posts#admin'

  get    'login'    => 'sessions#new'
  delete 'logout'   => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  get "/feed" => "static_pages#feed", as: "feed", defaults: { format: 'atom' }
end
