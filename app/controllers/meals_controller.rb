class MealsController < ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]
  before_action :admin_or_cook, :except => [:show]


  def admin_or_cook
      if admin_signed_in?
        return true
      else
        authenticate_cook!
      end
  end

  def validDates?(params, meal)
    from = Time.zone.parse(params[:availability_from])
    to =   Time.zone.parse(params[:availability_to])
    now = Time.zone.now
    if to < from
      meal.errors[:base] << "Meal availability end date cannot be before the begin date"
      return false
    elsif from < now
      meal.errors[:base] << "Meal begin date must be after todays date and time"
      return false
    else
      return true
    end
  end

  # GET /meals
  # GET /meals.json
  def index
      @meals = Meal.where('cook_id' => current_cook.id)
  end

  # GET /meals/1
  # GET /meals/1.json
  def show
    @cook = Cook.where('id' => @meal.cook_id).first
    @reviews = @meal.reviews
    @meals = Meal.where("availability_to > ?", Time.zone.now.beginning_of_day).where(active: true).limit(4)

  end

  # GET /meals/new
  def new
    @meal = Meal.new
  end

  # GET /meals/1/edit
  def edit
    if @meal.availability_from
      @availability_from_formatted = @meal.availability_from.strftime(Constants::TIME_FORMAT)
    end

    if @meal.availability_to
      @availability_to_formatted = @meal.availability_to.strftime(Constants::TIME_FORMAT)
    end
  end

  # POST /meals
  # POST /meals.json
  def create
    # Setting timezone to Pacific Standard
    @tz = " -08:00"
    @meal = Meal.new(meal_params)
    @meal.cook_id = current_cook.id
    @meal.active = true

    available_from_string = params[:meal][:availability_from]
    available_to_string = params[:meal][:availability_to]

    available_from = DateTime.parse(available_from_string + @tz)
    available_to = DateTime.parse(available_to_string + @tz)
    @meal.availability_from = available_from
    @meal.availability_to = available_to
    respond_to do |format|
      if validDates?(meal_params, @meal) &&  @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @meal }
      else
        format.html { render :new }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meals/1
  # PATCH/PUT /meals/1.json
  def update
    respond_to do |format|
      if validDates?(meal_params, @meal) && @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @meal }
      else
        format.html { render :edit }
        format.json { render json: @meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meals/1
  # DELETE /meals/1.json
  def destroy
    @meal.active = !@meal.active
    @meal.save
    if !@meal.active
      redirect_to @meal, notice: 'Successfully Discontinued Meal'
    else
      redirect_to @meal, notice: 'Successfully Offered Meal Again'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meal_params
      params.require(:meal).permit(:title, :description, :ingredients, :portion_info, :availability_from, :availability_to, :images, :location, :pickup_only, :delivery_only, :tags, :meal_cost)
    end
end
