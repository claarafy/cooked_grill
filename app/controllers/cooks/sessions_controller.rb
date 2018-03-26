# frozen_string_literal: true
include Accessible

class Cooks::SessionsController < Devise::SessionsController
  before_action :already_logged_in, :except => [:destroy, :create]
  skip_before_action :verify_authenticity_token


  def already_logged_in
   if user_signed_in? || cook_signed_in?
     raise "Not permitted"
   end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
