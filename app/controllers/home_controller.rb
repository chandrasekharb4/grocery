class HomeController < ApplicationController
	PRODUCTS_PER_PAGE = 12;
  def index
  	@ads = Ad.all;
  	@cats = Category.all
  	@page = params.fetch(:page,0).to_i;
    @all = Product.count;
    @end = (@all/PRODUCTS_PER_PAGE) - 1;
  @products = Product.joins(:category).order("created_at DESC").offset(@page * PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
  
  end

  def more
  	@ads = Ad.all;
  	@cats = Category.all
  	@page = params.fetch(:page,0).to_i;
    @all = Product.count;
    @end = (@all/PRODUCTS_PER_PAGE) - 1;
  @products = Product.joins(:category).order("created_at DESC").offset(@page * PRODUCTS_PER_PAGE).limit(PRODUCTS_PER_PAGE)
  render json: @products;
  end

  def show
  end
end
