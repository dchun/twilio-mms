class User < ApplicationRecord
  acts_as_token_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :services
  has_many :outgoing_messages
  has_many :incoming_messages
  has_many :payments

  before_create :trial_expiration

private
  def trial_expiration
    self.valid_until = Date.today + 1.week
  end
end
