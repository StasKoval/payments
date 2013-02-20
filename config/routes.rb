Payments::Application.routes.draw do
  resources :periods


  resources :recipients


  resources :payers


  resources :payments


	resources :payments
	root to: 'payments#index'
end
