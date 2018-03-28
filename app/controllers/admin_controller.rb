class AdminController < ApplicationController
  before_action :authenticate_admin!

  def home
  end

  def meals
    @meals = Meal.all
  end

  def orders
    @orders = Order.all
  end

  def users
    @users = User.all
  end

  def cooks
    @cooks = Cook.all
  end

  def payouts
    # Change later TODO
    @cooks = Cook.all
  end

  def reviews
    @reviews = Review.all
  end
end
