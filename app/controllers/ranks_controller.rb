class RanksController < ApplicationController
  before_action :set_rank, only: :update

  # POST /ranks
  def create
    @rank = current_user.ranks.create(rank_params)

    if @rank.save
      render json: @rank, status: :created, location: @rank
    else
      render json: @rank.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ranks/1
  def update
    if @rank.update(rank_params)
      render json: @rank
    else
      render json: @rank.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rank
    @rank = Rank.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rank_params
    params.require(:rank).permit(:score, :product_id)
  end
end
