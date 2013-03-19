Payments::Application.routes.draw do

  #root to: "sessions#new"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/payments')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  match 'signin', to: 'sessions#new', as: 'signin'

  resources :identities

  resources :periods


  resources :recipients


  resources :payers


  resources :payments

  resources :items

	resources :payments
	root to: 'payments#index'


end
