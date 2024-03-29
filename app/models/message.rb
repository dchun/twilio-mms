class Message < ApplicationRecord
  mount_uploader :media, MediaUploader

  belongs_to :user

  has_many :outgoing_messages

  default_scope { order('id DESC') }

  validates_presence_of :sender_number
  
  RECIPIENTS_JSON_SCHEMA = Rails.root.join('config', 'schemas', 'recipients.json_schema').to_s

  validates :recipients, presence: true, json: { schema: RECIPIENTS_JSON_SCHEMA }

end
