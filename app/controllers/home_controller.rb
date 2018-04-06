class HomeController < ApplicationController
  def index
    @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true)
    @family_meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true, family_deal: true)
    @low_carb_meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true, low_carb: true)
    if !@contact
      @contact = Contact.new
    end
    # TODO temp fix, change later
    @chefs = Cook.limit(10)
  end

  def subscribe_create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    @chefs = Cook.limit(10)
    if @contact.deliver
      flash.now[:notice_subscribe] = 'Thank you. You have been subscribed!'
      @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true)
      render :index
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end

  def about_cook
  end

  def about_delivery
  end

  def about_health
  end

  def about_payment
  end
end
