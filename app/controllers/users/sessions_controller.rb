# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super do |resource|
      flash[:notice] = "Welcome back, #{resource.first_name}!"
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super do |resource|
      flash[:notice] = "Goodbye! You have been logged out."
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :email, :profile_picture, :password, :password_confirmation])
  end
end
