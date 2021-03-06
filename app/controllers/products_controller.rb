class ProductsController < ApplicationController
  before_action :authenticate_user!, only: %i[show update destroy]
  before_action :set_product, only: %i[show update destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    if current_user.seller?
      render json: @product.to_json(include: :orders)
    else
      render json: @product.to_json(include: :seller)
    end
  end

  # POST /products
  def create
    @product = current_user.products.create(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :description, :price, :uom, :stock, :store_id, :category, :image)
  end
end
