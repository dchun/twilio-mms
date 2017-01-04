class Message < ApplicationRecord
  mount_uploader :media, MediaUploader

  belongs_to :user

  validates_presence_of :recipients
  
  RECIPIENTS_JSON_SCHEMA = Rails.root.join('config', 'schemas', 'recipients.json_schema').to_s

  validates :recipients, presence: true, json: { schema: RECIPIENTS_JSON_SCHEMA }

end
