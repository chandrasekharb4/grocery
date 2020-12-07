class CategoriesController < ApplicationController
  def index
  	@cat = Category.find_by_id([params[:id]])
  	@products = [];
  	#@products = Product.where(Category:[params[:id]])
  	@products = Product.joins(:category).where(['categories.id = ?' , 2])

  end

  def new
  		@category = Category.new()
  		render 'new'
  end
  def create
  @category = Category.new(cat_params)
		if @category.save
			redirect_to :controller => 'categories', :action => 'categoriesAdmin'
		else 
			redirect_to :controller => 'categories', :action => 'categoriesAdmin'
		end
  end


  def edit
    #@book = Book.new
    @category = Category.find_by_id([params[:id]])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(cat_params)
      redirect_to :controller => 'categories', :action => 'categoriesAdmin'
    else
      render :action => 'edit'
    end

  end


  def delete
  @category = Category.find(params[:id]).destroy
  redirect_to :controller => 'categories', :action => 'categoriesAdmin'
end

  def categoriesAdmin
  	@cats = Category.all
  	
  end
  private
		def cat_params
			params.require(:category).permit(:name,:image_url)
		end

end
