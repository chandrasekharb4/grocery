class ProductController < ApplicationController
  def index
  		@product = Product.find_by_id([params[:id]]);
  		cat = @product.category;
  		@products = Product.where(Category:cat)
  end
end
