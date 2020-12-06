class HomeController < ApplicationController
  def index
  	@ads = Ad.all;
  	@cats = Category.all
  @products = Product.joins(:category)
  end

  def show
  end
end
