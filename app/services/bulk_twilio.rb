class BulkTwilio

  def initialize(service_id, authentication_token, message, user)
    @client = Twilio::REST::Client.new(service_id, authentication_token)
    @message = message
    @user = user
  end

  def send
    @message.recipients.each do |recipient|
      info = {}
      info[:from] = @message.sender_number
      info[:to] = recipient["number"]
      info[:body] = @message.content
      info[:media_url] = @message.media if @message.media.present?
      info[:status_callback] = "https://twilio-mms.herokuapp.com/outgoing_messages/update_status?user_email=#{@user.email}&user_token=#{@user.authentication_token}"
      begin
        m = @client.messages.create(info)
        OutgoingMessage.create(zid: recipient["id"], name: recipient["name"], sid: m.sid, number: m.to, status: m.status, message: @message, user: @user)
      rescue Twilio::REST::RequestError => e
        Rails.logger.debug e.message
      end
    end
  end

end