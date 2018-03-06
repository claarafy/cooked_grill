# ../controllers/concerns/accessible.rb
module Accessible
  extend ActiveSupport::Concern
  included do
    # before_action :check_user
  end

  protected
  def check_user
    if current_cook
      flash.clear
      # if you have rails_cook. You can redirect anywhere really
      redirect_to(rails_cook.dashboard_path) && return
    elsif current_user
      flash.clear
      # The authenticated root path can be defined in your routes.rb in: devise_scope :user do...
      redirect_to(authenticated_user_root_path) && return
    end
  end
end