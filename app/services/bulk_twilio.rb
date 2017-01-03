class BulkTwilio

  def initialize(id, token)
    @client = Twilio::REST::Client.new(id, token)
  end

  def send(from, recipients, body, media)
    recipients.each do |id, number|
      begin
        if media.present?
          message = @client.messages.create(
            from: from, 
            to: number, 
            body: body, 
            media_url: media
          )
        else
          message = @client.messages.create(
            from: from, 
            to: number, 
            body: body
          )
        end
      rescue Twilio::REST::RequestError => e
        Rails.logger.debug e.message
      end
    end
  end
end