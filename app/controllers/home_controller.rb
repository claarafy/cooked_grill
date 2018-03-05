class HomeController < ApplicationController
  def index
    @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true)
  end
end
