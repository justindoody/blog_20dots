Rails.application.routes.draw do
  resources :posts

  root 'posts#index'
  get 'about' => 'static_pages#about'

end
