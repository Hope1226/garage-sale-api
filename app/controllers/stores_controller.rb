class StoresController < ApplicationController
  before_action :authenticate_user!, only: %i[show update destroy]
  before_action :set_store, only: %i[show update destroy]

  # Get / Stores
  def index
    @stores = Store.all
    render json: @stores.to_json(include: :products)
  end

  # Get / Stores / 1

  def show
    render json: @store.to_json(include: :products)
  end

  # Post / Stores
  def create
    @new_store = current_user.stores.create(store_params)
    if @new_store.save
      render json: @new_store, status: :created, location: @store
    else
      render json: @new_store.errors, status: :unprocessable_entity
    end
  end

  # PATCH / PUT / stores / 1
  def update
    if @store.update(store_params)
      render json: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE / stores / 1
  def destroy
    @store.destroy
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :description)
  end
end
