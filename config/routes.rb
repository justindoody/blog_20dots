Rails.application.routes.draw do
  resources :posts do
    member do
      get :publish, :unpublish
    end
  end
  get 'admin' => 'posts#admin'

  root 'posts#index'
  get 'about' => 'static_pages#about'

  get    'login'    => 'sessions#new'
  delete 'logout'   => 'sessions#destroy'
  resources :sessions, only: [:new, :create, :destroy]

  get "/feed" => "static_pages#feed", :as => "feed", :defaults => { :format => 'atom' }
end
