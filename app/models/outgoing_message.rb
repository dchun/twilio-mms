class OutgoingMessage < ApplicationRecord
  belongs_to :message
  belongs_to :user
  
  default_scope { order('id DESC') }

  after_save :update_zoho
  
private
  def update_zoho
    if self.status == 'delivered'
      if zoho_account = self.user.services.find_by_name('zoho')
        zoho = Zoho.new(zoho_account.service_id, zoho_account.authentication_token, self.zid, self.message)
        response = zoho.update
      end
    end
  end
end
