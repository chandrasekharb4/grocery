class CategoriesController < ApplicationController
  def index
  	@cat = Category.find_by_id([params[:id]])
  	@products = [];
  	#@products = Product.where(Category:[params[:id]])
  	@products = Product.joins(:category).where(['categories.id = ?' , 2])

  end

  def add
  end

  def categoriesAdmin
  	@cats = Category.all
  end
end
