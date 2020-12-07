class ProductsController < ApplicationController
  PRODUCTS_PER_PAGE = 10;
  #Show individual produt details
  def index
  		@product = Product.find_by_id([params[:id]]);
  		cat = @product.category;
  		@products = Product.where(Category_id:cat)
  end

  #Displying admin products
  def productsAdmin
    @page = params.fetch(:page,0).to_i;
    @all = Product.count;
    @end = (@all/PRODUCTS_PER_PAGE) - 1;
  	@products = Product.joins(:category).order("created_at DESC").offset(@page * PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
  end

  #Display new product creation
  def new
  	@product = Product.new()
  	@categories = Category.all
  	render 'new';
  end

 #Create new product

 def create
  @product = Product.new(product_params)
		if @product.save
			redirect_to :controller => 'products', :action => 'productsAdmin'
		else 
			redirect_to :controller => 'products', :action => 'productsAdmin'
		end
  end

  #Edit page
  def edit
    #@book = Book.new
    @product = Product.find_by_id([params[:id]])
  end

  #Update 
  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to :controller => 'products', :action => 'productsAdmin'
    else
      render :action => 'edit'
    end

  end

  #Delete
  def delete
  @product = Product.find(params[:id]).destroy
  redirect_to :controller => 'products', :action => 'productsAdmin'
end

   private
		def product_params
			params.require(:product).permit(:name,:image_url,:price,:offer_price,:description,:category_id)
		end
end
