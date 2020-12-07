Rails.application.routes.draw do
  resources :products, :categories

	get '/', to: 'home#index'
	get '/admin', to: 'admin#index'

	
	get '/categories/:name/:id', to: 'categories#index'
	get '/product/:name/:id', to: 'product#index'

	#admin products
	get '/admin/products', to:'product#productsAdmin'
	#admin categories
	get '/admin/categories/delete/:id', to: 'categories#delete'
	get '/admin/categories', to:'categories#categoriesAdmin'
	get '/admin/categories/new', to:'categories#new'
	get 'admin/categories/add', to:'categories#add'
	get '/admin/categories/edit/:id', to: 'categories#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
