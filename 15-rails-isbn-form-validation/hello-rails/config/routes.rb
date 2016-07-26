Rails.application.routes.draw do
	
	resources :books do
		resources :comments
	end

	root to: 'pages#home'
end
