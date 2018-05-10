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
    mail(to: @cook.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "CookedNearby.Com order has been CANCELED")
  end

  def new_cook(cook)
    @cook = cook
    @url  = # generate confirmation url
    mail(to: @cook.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "Welcome to Cooked Nearby")
  end

  def new_user(user)
    @user = user
    @url  = # generate confirmation url
    mail(to: @user.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "Welcome to Cooked Nearby")
  end

  def new_meal(meal)
    @meal = meal
    @url  = # generate confirmation url
    mail(to: @meal.cook.email, bcc: ENV["DEFAULT_TO_EMAIL"], subject: "Congrats, new meal has been uploaded to Cooked Nearby")
  end

end
