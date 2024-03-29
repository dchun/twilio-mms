class IncomingMessage < ApplicationRecord
  belongs_to :user

  default_scope { order('id DESC') }

  after_save :update_zoho
  
private
  def update_zoho
    outgoing_message = self.user.outgoing_messages.find_by_number(self.number)
    if outgoing_message && ['sent', 'delivered'].include?(outgoing_message.status)
      service = outgoing_message.message.service
      case service
      when 'zoho'
        if zoho_account = self.user.services.find_by_name('zoho')
          zoho = Zoho.new(zoho_account.service_id, zoho_account.authentication_token, outgoing_message.zid, outgoing_message.message, self)
          response = zoho.update
        end
      end
    end
  end
end
