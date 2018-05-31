Rails.application.routes.draw do
  resources :comments, only: [:new, :create, :destroy]

  get 'home' => 'pages/home'

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'sessions/new'

	get 'signup' => 'users#new'

  get 'login' => 'sessions#new'

  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'

	resources :users

	root to: 'pages#home'

	resources :account_activations , only: [:edit]

	resources :password_resets, only: [:new, :create, :edit, :update]

  resources :posts

	resources :topics


	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
