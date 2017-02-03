class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  acts_as_token_authentication_handler_for User

  before_action :expired?

  def expired?
    if current_user.present?
      if Date.today > current_user.valid_until
        flash.now[:alert] = "This account is overdue. Make a payment #{view_context.link_to 'here', new_payment_path} to avoid service interruption.".html_safe
        if Date.today > current_user.valid_until + 1.week
          redirect_to new_payment_path, alert: 'This account has been suspended for non-payment. Please make a payment to continue service.'
        end
      end
    end
  end
end
