class IncomingMessagesController < ApplicationController
  skip_before_action  :verify_authenticity_token
  before_action :set_incoming_message, only: [:show]

  # GET /incoming_messages
  # GET /incoming_messages.json
  def index
    @incoming_messages = current_user.incoming_messages.page(params[:page])
  end

  # GET /incoming_messages/1
  # GET /incoming_messages/1.json
  def show
  end

  # POST /incoming_messages
  # POST /incoming_messages.json
  def create
    @incoming_message = IncomingMessage.new(
      sid: params[:SmsSid], 
      number: params[:From], 
      content: params[:Body], 
      user: current_user
    )

    respond_to do |format|
      if @incoming_message.save
        format.xml { render xml: @incoming_message.to_xml, status: :created, location: @user }
      else
        format.xml { render xml: @incoming_message.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_incoming_message
      @incoming_message = current_user.incoming_messages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def incoming_message_params
      params.require(:incoming_message).permit(:sid, :number, :content, :user_id, :SmsSid, :From, :Body)
    end
end
