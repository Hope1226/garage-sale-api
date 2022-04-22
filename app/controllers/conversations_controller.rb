class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: %i[show destroy]

  # GET /conversations
  def index
    if current_user.seller?
      @conversations = Conversation.all.where(seller_id: current_user.id)
      render json: @conversations.to_json(include: %i[customer messages])
    else
      @conversations = Conversation.all.where(customer_id: current_user.id)
      render json: @conversations.to_json(include: %i[seller messages])
    end
  end

  # GET /conversations/1
  def show
    if current_user.seller?
      render json: @conversation.to_json(include: %i[customer messages])
    else
      render json: @conversation.to_json(include: %i[seller messages])
    end
  end

  # POST /conversations
  def create
    @conversation = current_user.conversations.create(conversation_params)

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
