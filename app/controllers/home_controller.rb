class HomeController < ApplicationController
  def index
    @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true)
    if !@contact
      @contact = Contact.new
    end
  end

  def subscribe_create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice_subscribe] = 'Thank you. You have been subscribed!'
      @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true)
      render :index
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end
end
