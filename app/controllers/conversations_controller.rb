class ConversationsController < ApplicationController
  before_action :set_conversation, only: %i[show destroy]

  # GET /conversations
  def index
    if current_user.seller?
      @conversations = Conversation.all.where(seller_id: current_user.id)
      render json: @conversations.to_json(include: :customer)
    else
      @conversations = Conversation.all.where(customer_id: current_user.id)
      render json: @conversations.to_json(include: :seller)
    end
  end

  # GET /conversations/1
  def show
    render json: @conversation
  end

  # POST /conversations
  def create
    @conversation = current_user.constraints.create(conversation_params)

    if @conversation.save
      render json: @conversation, status: :created, location: @conversation
    else
      render json: @conversation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /conversations/1
  def destroy
    @conversation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conversation_params
      params.require(:conversation).permit(current_user.seller? ? :customer_id : :seller_id)
    end
end
