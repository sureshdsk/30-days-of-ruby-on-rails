Rails.application.routes.draw do
	resources :books
	root to: 'pages#home'
end
