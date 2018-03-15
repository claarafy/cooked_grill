class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # config.time_zone = 'Pacific Time (US & Canada)'
  before_action :set_user_time_zone, :index
  $timeFormat = "%b %e, %l:%M %p %Z"

  def index
    @contact = Contact.new
  end

  def set_user_time_zone
    Time.zone = 'Pacific Time (US & Canada)'
    # Change to something like Time.zone = current_user.time_zone
    # => #<ActiveSupport::TimeZone:0x007fb80d1374d8 @name="Pacific/Honolulu" [...] >
  end
  # before_action :authenticate_user!, :except => [:index]

  # Temp for HTTP Verification
  # TODO remove later. Not needed anymore.
  def download_file
    send_file 'app/assets/videos/B7C7017DAF6B1432EB6A73124F6494CC.txt'
  end
end
