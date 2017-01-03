class MessagesController < ApplicationController
  skip_before_action  :verify_authenticity_token
  before_action :set_message, only: [:show, :edit, :update, :send_form, :send_message, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @messages = current_user.messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.user = current_user

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /messages/1/send_form
  def send_form
  end

  # PATCH/PUT /messages/1/send
  def send_message
    respond_to do |format|
      twilio_account = current_user.services.find_by_name('twilio')
      if twilio_account
        if @message.update(message_params)
          recipients = {'david' => '3104255775', 'david2' => '+14244420347'}
          twilio = BulkTwilio.new(twilio_account.service_id, twilio_account.authentication_token)
          sent = twilio.send('+17026057410', recipients, @message.content, @message.media)
          format.html { redirect_to @message, notice: 'Message was successfully sent.' }
          format.json { render :show, status: :ok, location: @message }
        else
          format.html { render :send }
          format.json { render json: @message.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to send_form_message_url, notice: 'Twilio has not been properly set up.' }
        format.json { render json: 'Twilio has not been properly set up.', status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = current_user.messages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :media, :sender, :recipient_type, :user_id, recipients: [:id, :number])
    end
end