Rails.application.routes.draw do
  
  get '/', to: 'home#index'
  get '/admin', to: 'admin#index'
  get '/categories/:name/:id', to: 'categories#index'
  get '/product/:name/:id', to: 'product#index'
  get '/admin/categories', to:'categories#categoriesAdmin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
