class Zoho
  require 'builder'
  require 'uri'
  require 'net/http'

  def initialize(token, ids, message)
    @token = token
    @ids = ids
    @message = message
  end

  def update_message
    if @ids.any?
      xml = Builder::XmlMarkup.new

      xml.CustomModule1 do |c|
        row_count = 1
        @ids.each do |id|
          c.row no: row_count do |r|
            r.FL "MMS Sent", val: "MMS Name"
            r.FL @message.content, val: "Content"
            r.FL @message.media, val: "Media"
            if @message.recipient_type == 'lead'
              r.FL id, val: "Lead_ID"
            elsif @message.recipient_type == 'contact'
              r.FL id, val: "Contact_ID"
            end
          end
          row_count += 1
        end
      end

      uri = URI.parse('https://crm.zoho.com/crm/private/xml/CustomModule1/insertRecords')
      params = { 
        newFormat: 1, 
        authtoken: @token,
        scope: 'crmapi',
        xmlData: xml.target!
      }
      uri.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(uri)
      puts res.body if res.is_a?(Net::HTTPSuccess)
    end
  end

end