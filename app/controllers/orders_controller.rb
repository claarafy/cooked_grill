class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update]
  before_action :user_or_cook_authorized
  before_action :user_only, only: [:edit, :destroy]

  def validDate?(params, meal, order)
    pickup_date = Time.zone.parse(params[:pickup_date])
    valid_from = meal.availability_from
    valid_to =   meal.availability_to
    now = Time.zone.now
    if pickup_date < valid_from || pickup_date > valid_to || pickup_date < now
      order.errors[:base] << "Your pickup date and time is not valid. Please check meal availability."
      return false
    else
      return true
    end
  end

  def user_only
    if !user_signed_in? && !admin_signed_in?
      redirect_to root_path, :alert => "Only users can delete or edit an order"
    end
  end

  def user_or_cook_authorized
   unless user_signed_in? || cook_signed_in? || admin_signed_in?
     authenticate_user!
   end
  end

  # GET /orders
  # GET /orders.json
  def index
    if user_signed_in?
      @orders = Order.where("user_id = ?", current_user.id)
    end
    if cook_signed_in?
      @orders = Order.joins(:meal).where('meals.cook_id' => current_cook.id)
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    if params[:mealID].present? && user_signed_in?
      @order = Order.new
      @order.meal_id = params[:mealID]
      @meal = Meal.find(params[:mealID])
      @cook = Cook.find(@meal.cook_id)
      @price =  Meal.find(@meal.id).meal_cost
      #  TODO Currently not used
      delivery_pickup = ""
      if @meal.delivery_only
        delivery_pickup = "delivery"
      elsif @meal.pickup_only
        delivery_pickup = "pickup"
      else
        delivery_pickup = "delivery or pickup"
      end
      # End of unused code
    else
        redirect_to root_path, :alert => "Must provide mealID and must be signed in as a non-cook user"
    end
  end

  # GET /orders/1/edit
  def edit
    if @order.paid
      redirect_to orders_path, :alert => "Sorry this order has already been paid and cannot be modified or canceled"
    end
    @meal = Meal.find(@order.meal_id)
    @cook = Cook.find(@meal.cook_id)
    @price =  @meal.meal_cost
    if @order.pickup_date
      @pickup_date_formatted = @order.pickup_date.strftime(Constants::TIME_FORMAT)
    end
  end

  # POST /orders
  # POST /orders.json
  def create
      # Setting timezone to Pacific Standard
      @tz = " -08:00"

      # Make sure User is logged in
      if !user_signed_in?
        redirect_to root_path, :alert => "Must be signed in as non-cook user"
      end

      # Getting Order and Meal objects
      @order = Order.new(order_params)
      @mealID = order_params[:meal_id]
      @meal = Meal.find(@mealID)
      @cook = Cook.find(@meal.cook_id)
      @price =  @meal.meal_cost

      # Pickup / Delivery TODO somewhat sloppy. Doesn't handle errors.
      if params[:inputPickupDelivery] == "Delivery"
        @order.delivery = true
      else params[:inputPickupDelivery] == "Pickup"
        @order.pickup = true
      end

      # Pickup/Delivery DateTime
      pickup_datetime_string = order_params[:pickup_date]
      pickup_datetime = DateTime.parse(pickup_datetime_string + @tz)
      @order.pickup_date = pickup_datetime

      # Pickup Address
      pickupAddress = @meal.location
      @order.pickup_address = pickupAddress

      # Buyer/User
      if user_signed_in?
        @order.user_id = current_user.id
      else
        redirect_to root_path, :alert => "User is not logged in"
      end

      # Total Cost
      quantity = order_params[:quantity].to_i
      price = Meal.find(@mealID).meal_cost
      total = quantity * price
      @order.total_cost = total
      @order.cook_total = (total * 0.78)

      # order_date
      now = Time.zone.now
      @order.order_date = now

      # Attach an empty review
      @order.review = Review.new

      respond_to do |format|
        if validDate?(order_params, @meal, @order) && @order.save
          format.html { redirect_to @order, notice: 'Pay to Finish the Transaction.' }
          format.json { render :show, status: :created, location: @order }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @meal = Meal.find(@order.meal_id)
    @cook = Cook.find(@meal.cook_id)
    @price =  @meal.meal_cost

    # Total Cost
    quantity = order_params[:quantity].to_i
    price = @meal.meal_cost
    total = quantity * price
    @order.total_cost = total
    @order.cook_total = (total * 0.78)
    @order.review = Review.new

    # Pickup / Delivery TODO somewhat sloppy. Doesn't handle errors.
    if params[:inputPickupDelivery] == "Delivery"
      @order.delivery = true
    else params[:inputPickupDelivery] == "Pickup"
      @order.pickup = true
    end

    respond_to do |format|
      if validDate?(order_params, @meal, @order) && @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }

      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    if @order != nil && @order.paid
      redirect_to root_path, :alert => "Sorry this order has already been paid and cannot be modified or canceled"
    end
    @user = User.find(@order.user_id)
    meal = Meal.find(@order.meal_id)
    @cook = Cook.find(meal.cook_id)
    if @order.destroy
      respond_to do |format|
        if admin_signed_in?
          format.html { redirect_to admin_orders_path, notice: 'Order was successfully Canceled.' }
          format.json { head :no_content }
        else
          format.html { redirect_to orders_url, notice: 'Order was successfully Canceled.' }
          format.json { head :no_content }
        end
      end
    else
      redirect_to root_path, :alert => "Failed to CANCEL Order, please contact the administrator"
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      if user_signed_in?
        unless current_user.id == @order.user_id
          redirect_to root_path, :alert => "Not a valid order for logged in user"
        end
      end
      if cook_signed_in?
        meal = Meal.where('id' => @order.meal_id)
        unless current_cook.id == meal.first.cook_id
          redirect_to root_path, :alert => "Not a valid order for logged in cook"
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:quantity, :delivery_address, :delivery, :pickup, :order_date, :pickup_date, :customer_phone, :meal_id, :inputPickupDelivery)
    end
end
