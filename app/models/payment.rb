class Payment < ApplicationRecord
  belongs_to :plan
  belongs_to :user

  validates_presence_of :user, :plan, :email, :amount, :description, :card_token, :customer_token

  def process_payment
    customer = Stripe::Customer.create(email: email,
                                       card: card_token)

    Stripe::Charge.create(customer: customer.id,
                          amount: plan.price.to_i * 100,
                          description: plan.name,
                          currency: 'usd')

    self.customer_token = customer.id
    self.amount = plan.price
    self.description = plan.name
    renew
  end

  def renew
    user.update_attribute :valid_until, Date.today + 1.month
  end

end
