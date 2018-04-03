class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :user_logged_in, only: [:new, :create, :edit, :update, :destroy, :index]
  skip_before_action :verify_authenticity_token


  # GET /reviews
  # GET /reviews.json
  def index
    if user_signed_in?
      @reviews = Review.where("user_id = ?", current_user.id)
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @order = Order.find(@review.order_id)
  end

  # GET /reviews/new
  def new
    @review = Review.new
    if !params[:order]
      redirect_to root_path, :alert => "Can't create review. Missing param."
    end
    @order = Order.find(params[:order])
    if !canLeaveFeedback(@order)
      redirect_to root_path, :alert => "Sorry, cannot leave feedback. You might have already left feedback on this meal."
    end

  end

  # GET /reviews/1/edit
  def edit
    @order = Order.find(@review.order_id)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = params[:review][:user].to_f
    @review.meal_id = params[:review][:meal].to_f
    @order = Order.find(params[:review][:order_id])
    @order.reviewed = true
    @review.order = @order
    @review.order_id = @order.id
    @order.review = @review

    respond_to do |format|
      if @review.save && @order.save
        format.html { redirect_to @review, notice: 'You have successfully left a review.' }
        format.json { render :show, status: :created, location: @review }
      else
        flash[:error] = "Sorry, something went wrong"
        format.html { redirect_to controller: 'reviews', action: 'new', order: @order.id }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
        params.require(:review).permit(:text, :rating)
    end

    # Make sure we have the appropriate user
    def user_logged_in
      if !user_signed_in? && !admin_signed_in?
        redirect_to root_path, :alert => "A User Must be Logged In"
      end
    end
end
