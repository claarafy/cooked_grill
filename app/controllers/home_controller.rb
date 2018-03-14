class HomeController < ApplicationController
  def index
    @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true)
    @contact = Contact.new
  end

  def contact_create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to root_path
    end
  end
end
