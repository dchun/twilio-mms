class PaymentsController < ApplicationController
  skip_before_action :expired?, only: [:new, :create, :webhook]
  skip_before_action :authenticate_user!, only: [:webhook], :if => lambda { 
    if params[:token]
      params[:token] == ENV['stripe_webhook_token']
    else
      false
    end
  }

  def index
    @payments = current_user.payments.page(params[:page])
  end

  def show
    @payment = current_user.payments.find(params[:id])
  end

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new payment_params.merge(email: stripe_params["stripeEmail"],
                                                card_token: stripe_params["stripeToken"],
                                                user: current_user)
    @payment.process_payment
    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment, notice: 'Payment was successfully made.' }
      else
        format.html { render :new }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    render :new
  end

# POST /payments/webhook
protect_from_forgery except: :webhook
  def webhook
    event = Stripe::Event.retrieve(params["id"])

    case event.type
      when "invoice.payment_succeeded" #renew subscription
        Payment.find_by_customer_id(event.data.object.customer).renew
    end
    render status: :ok, json: "success"
  end

private
  # Never trust parameters from the scary internet, only allow the white list through.
  def payment_params
    params.require(:payment).permit(:email, :description, :price, :card_token, :customer_token, :plan_id, :user_id)
  end

  def stripe_params
    params.permit :stripeEmail, :stripeToken
  end
end
