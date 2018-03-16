class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user_time_zone, :set_contact

  $timeFormat = "%b %e, %l:%M %p %Z"

  private
  def set_contact
    @contact = Contact.new
  end

  def set_user_time_zone
    Time.zone = 'Pacific Time (US & Canada)'
    # Change to something like Time.zone = current_user.time_zone
  end

end
