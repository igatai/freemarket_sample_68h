class ProductsController < ApplicationController
  # before_action :set_product, except: [:index, :new, :create]

  def index
    @product = Product.where(brand_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
  end


  def new
    @product = Product.new
    @product.images.new
  end

  def create
    @product = Product.new(product_params)
    binding.pry
    if @product.save
      redirect_to root_path
    else
      redirect_to new_product_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to ''
    else
      render :edit
    end
  end

  def show

  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :condition, :status, :payment, :delivery_date, :delivery_method, :price, :user_id, :bland_id, :category_id, :prefecture_id, images_attributes: [:image, :_destroy, :id]).merge( user_id: current_user_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
