class OutgoingMessagesController < ApplicationController
  skip_before_action  :verify_authenticity_token
  before_action :set_outgoing_message, only: [:show]

  # GET /outgoing_messages
  # GET /outgoing_messages.json
  def index
    @outgoing_messages = current_user.outgoing_messages.page(params[:page])
  end

  # GET /outgoing_messages/1
  # GET /outgoing_messages/1.json
  def show
  end

  # POST /outgoing_messages/update_status
  def update_status
    @outgoing_message = current_user.outgoing_messages.find_by_sid(params['MessageSid'])

    respond_to do |format|
      if @outgoing_message.update_attribute(:status, params['MessageStatus'])
        format.json { render :show, status: :ok, location: @outgoing_message }
      else
        format.json { render json: @outgoing_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_outgoing_message
      @outgoing_message = current_user.outgoing_messages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def outgoing_message_params
      params.require(:outgoing_message).permit(:zid, :name, :sid, :number, :status, :message_id, :user_id)
    end
end
