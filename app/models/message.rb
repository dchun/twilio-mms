class Message < ApplicationRecord
  belongs_to :user

  validates_presence_of :content
  validates_presence_of :recipients
end
