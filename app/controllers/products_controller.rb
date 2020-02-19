class ProductsController < ApplicationController

  def index
    @product = Product.all.limit(3)
  end
end