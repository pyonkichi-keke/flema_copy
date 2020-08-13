class ProductsController < ApplicationController
  def index
    @categories = Category.all
    @products = Product.includes(:images).order('created_at DESC').limit(4)
  end

  def new
    if user_signed_in?
      @product = Product.new
      @product.images.new
    else
      flash[:alert] = "商品を出品するにはログインしてください。"
      redirect_to root_path and return
    end
    
  end

  def create
    @product = Product.new(product_params)
    unless @product.valid?
      flash[:alert] = "入力に誤りがあります。もう一度入力してください。"
      redirect_to action: :new and return
    end
    @product.save
    redirect_to root_path
    flash[:notice]= "商品を出品しました。"
  end

  def show
    @product = Product.find(params[:id])
    @user = User.find_by(id: @product.user_id)

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to root_path
    flash[:notice]= "商品を編集しました。"
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to root_path
    flash[:notice]= "商品を削除しました。"
  end



  # def search
  #   @products = Product.search(params[:keyword])
  #   respond_to do |format|
  #     format.json
  #   end
  # end

  
  private
  def product_params
    params.require(:product).permit(:name, :price, :text, :status_id, :size_id, :prefecture_id, :delivery_id, :deliverytime_id, :brand_id, :category_id, images_attributes:  [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

end
