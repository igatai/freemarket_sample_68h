class ProductsController < ApplicationController

  def index
    @product = Product.where(category_id: "1").first(3)
    @category = Product.where(category_id: "1").first(3)
    @brand = Product.where(brand_id: "2").first(3)
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def new
    
    @product = Product.new
    # @category_parent_array = ["---"]
    # @category_parent_array = [id: nil, name: "---"]
    # @category_parent_name_array = ["---"]
    # @category_parent_id_array = [""]
    @category_parent_pare = ["---",""]
    @category_parent_array = []
    @category_parent_array << @category_parent_pare
    #親カテゴリーのみ抽出 => 配列
    Category.where(ancestry: nil).each do |parent|
      # @category_parent_array << parent.name

      # category_parent_hash = {id: parent.id, name: parent.name}
      # @category_parent_array << category_parent_hash

      # category_parent_pare = [parent.id, parent.name]
      # @category_parent_array << category_parent_hash

      category_parent_pare = [parent.name, parent.id]
      @category_parent_array << category_parent_pare


      # @category_parent_name_array << parent.name
      # @category_parent_id_array << parent.id
    end
    # binding.pry
  end

  def get_category_children
    # binding.pry
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_selected_grandchild
    # @selected_id = Category.find("#{params[:grandchild_id]}").id
    # @selected_id = params[:grandchild_id]
    @category_grandchild = Category.find("#{params[:grandchild_id]}")
  end

  def create
    @user = current_user
    @product = Product.new(product_params)
    @product.save!
    # begin
    #   @product = Product.new(product_params)
    #   @product.save!
    # rescue
    #   redirect_to new_product_path
    # end
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :content, :condition, :status, :payment, :delivery_date, :delivery_method, :price, :user_id, :brand_id, :category_id ,:image_id, :prefecture_id).merge(user_id: current_user.id)
  end

end
