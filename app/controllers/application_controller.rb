class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_user_time_zone, :set_contact

  $timeFormat = "%b %e, %l:%M %p %Z"

  # Check if feedback can be left
  def canLeaveFeedback(order)
    valid = true
    # Make sure current user has purchased the meal and the order has been paid.
    if order.user_id != current_user.id
      valid = false
    elsif !order.paid || order.reviewed
      valid = false
    end
    # Make sure current user has not yet left a review
    reviewed = Review.where(["user_id = ? and meal_id = ?", order.user_id, order.meal_id])
    if reviewed.any?
      valid = false
    end
    return valid
  end

  helper_method :canLeaveFeedback

  private
  def set_contact
    @contact = Contact.new
  end

  def set_user_time_zone
    Time.zone = 'Pacific Time (US & Canada)'
    # TODO Change to something like Time.zone = current_user.time_zone
  end

end
