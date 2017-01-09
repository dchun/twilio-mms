class BulkTwilio

  def initialize(id, token, message)
    @client = Twilio::REST::Client.new(id, token)
    @message = message
  end

  def send
    accepted_recipients = []
    @message.recipients.each do |recipient|
      info = {}
      info[:from] = @message.sender
      info[:to] = recipient["number"]
      info[:body] = @message.content
      info[:media_url] = @message.media if @message.media.present?
      begin
        message = @client.messages.create(info)
        accepted_recipients << recipient["id"]
      rescue Twilio::REST::RequestError => e
        Rails.logger.debug e.message
      end
    end
    accepted_recipients
  end
end