class LandingPageController < ApplicationController
  def new_cook
    if !@user
      @user = User.new
      render layout: false
    else
      render layout: false
    end
  end

  def create
    # @user = User.new(params[:user])
    @user = User.new
    @user.first_name = params[:user][:first_name]
    @user.zip = params[:user][:zip]
    @user.email = params[:user][:email]
    # @user.password = Devise::Encryptor.digest(User, params[:user][:password])
    @user.password = params[:user][:password]
    if @user.save
      redirect_to root_path, notice: 'Thank you for siging up. Login to order meals.'
    else
      # @user.errors[:base] << @user.errors.full_messages
      # render landing_page_new_cook_path
      redirect_to landing_page_new_cook_path(user: @user)
      # redirect_back(fallback_location: root_path)
      # redirect_to landing_page_new_cook_path
    end
  end
end
