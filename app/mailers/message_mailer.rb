class MessageMailer < ApplicationMailer
  def order_paid_message_user(user, order)
    @user = user
    @order = order
    @url  = # generate confirmation url
    mail(to: @user.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "Order Paid")
  end

  def order_paid_message_cook(user, cook, order)
    @user = user
    @cook = cook
    @order = order
    @url  = # generate confirmation url
    mail(to: @cook.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "Order Paid")
  end

  def order_canceled_message_user(user, cook, order)
    @user = user
    @cook = cook
    @order = order
    @url  = # generate confirmation url
    mail(to: @cook.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "CookedNearby.Com Order Has Been CANCELED")
  end
end
