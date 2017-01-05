class Service < ApplicationRecord
  belongs_to :user

  NAMES = ["twilio", "zoho"]
  validates_inclusion_of :name, in: NAMES, message: " should contain #{NAMES}."
  validates_presence_of :service_id, :authentication_token
  validates_uniqueness_of :name, scope: :user_id

end
