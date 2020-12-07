Rails.application.routes.draw do
  devise_for :users
  resources :products, :categories

	get '/', to: 'home#index'
	get '/more', to: 'home#more'
	get '/admin', to: 'admin#index'

	
	#auth routes
	get '/login', to:'devise/sessions#new'
	get '/signup', to:'devise/registrations#new'
	
	get '/categories/:name/:id', to: 'categories#index'
	get '/product/:name/:id', to: 'products#index'

	#admin products
	get '/admin/products', to:'products#productsAdmin'
	get '/admin/products/new', to:'products#new'
	get '/admin/products/edit/:id', to: 'products#edit'
	get '/admin/products/delete/:id', to: 'products#delete'
	#admin categories
	get '/admin/categories/delete/:id', to: 'categories#delete'
	get '/admin/categories', to:'categories#categoriesAdmin'
	get '/admin/categories/new', to:'categories#new'
	get 'admin/categories/add', to:'categories#add'
	get '/admin/categories/edit/:id', to: 'categories#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
