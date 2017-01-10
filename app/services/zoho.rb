class Zoho
  require 'builder'
  require 'uri'
  require 'net/http'

  def initialize(service_id, authentication_token, zoho_id, message)
    @service_id = service_id
    @authentication_token = authentication_token
    @id = zoho_id
    @message = message
  end

  def update
    xml = Builder::XmlMarkup.new

    xml.CustomModule1 do |c|
      c.row no: 1 do |r|
        r.FL "MMS Sent", val: "MMS Name"
        r.FL @message.content, val: "Content"
        r.FL @message.media, val: "Media" if @message.media.present?
        r.FL @message.sender_name, val: "Sender" if @message.sender_name.present?
        if @message.recipient_type == 'lead'
          r.FL @id, val: "Lead_ID"
        else
          r.FL @id, val: "Contact_ID"
        end
      end
    end
    uri = URI.parse('https://crm.zoho.com/crm/private/xml/' + @service_id + '/insertRecords')
    params = { 
      newFormat: 1, 
      authtoken: @authentication_token,
      scope: 'crmapi',
      xmlData: xml.target!
    }
    uri.query = URI.encode_www_form(params)
    res = Net::HTTP.get_response(uri)
    puts res.body if res.is_a?(Net::HTTPSuccess)
  end

end