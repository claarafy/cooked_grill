require 'common_methods'

class ChargesController < ApplicationController
  include CommonMethods

  def new; end

  def create
    # Amount in cents
    @amount_cents = params[:total_cents].to_i
    @amount = params[:total].to_f

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount_cents,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

    orderID = params[:orderID]
    @order = Order.find(orderID)
    @meal = Meal.find(@order.meal_id)
    @cook = Cook.find(@meal.cook_id)
    @user = User.find(@order.user_id)
    # Logic of adding cooks balance here
    if @cook.balance
      @cook.balance = @cook.balance + (@amount_cents * Constants::COOKS_NET_PRECENTAGE)
    else
      @cook.balance = (@amount_cents * Constants::COOKS_NET_PRECENTAGE)
    end
    @cook.save
    @order.paid = true
    @order.review = Review.new

    if !@order.save
      flash[:error] = 'Sorry, Order did not go through!'
    else
      invite_user_to_onfleet(@order.user) if @order.pickup
      MessageMailer.order_paid_message_user(@user, @order).deliver_now
      MessageMailer.order_paid_message_cook(@user, @cook, @order).deliver_now
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
