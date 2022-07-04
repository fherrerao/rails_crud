class ProductsController < ApplicationController
  before_action :set_products, only: [:show, :destroy, :edit, :update]

  def index
    @products = Product.all
  end

  def edit    
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(products_params)
    @product.store_id = 1
    pp @product
    
    if @product.save      
      redirect_to store_products_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      redirect_to store_products_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(products_params)
      redirect_to store_products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end 

  private
  def set_products
    @product = Product.find(params[:id])    
  end

  def products_params
    params.require(:product).permit(:name, :value)
  end
end
