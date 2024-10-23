# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  include Rails.application.routes.url_helpers


  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :authenticate_user!, only: [:edit_password, :update_password]
  

  # GET /resource/sign_up
  def new
    @user = User.new
    super
  end

  # POST /resource
  def create
    super do |resource|
      if resource.save
        flash[:notice] = "Welcome, #{resource.email}! Your account has been successfully created."
      else
        flash[:alert] = "There was a problem creating your account."
      end
    end
  end

  # GET /resource/edit
  def edit
    @user = current_user
  end

  # PUT /resource
  def update
    super do |resource|
      if resource.update(account_update_params)
        flash[:notice] = "Your profile has been updated!"
      else
        flash[:alert] = "There was a problem updating your profile."
      end
    end
  end

  


  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # Edit action for password update
  def edit_password
    @user = current_user
  end

  # Update action for password update
  def update_password
    @user = current_user

    # Ensure current password is provided
    if @user.update_with_password(password_update_params)
      # Sign in the user again after password change, since Devise logs the user out by default
      bypass_sign_in(@user)
      redirect_to edit_user_registration_path, notice: 'Password successfully updated'
    else
      render 'edit_password'
    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.

  # Override Devise's method to handle updates without requiring current_password
  # def update_resource(resource, params)
  #   # If the user is not trying to change their password, allow updating without current_password
  #   if params[:password].blank? && params[:current_password].blank?
  #     resource.update_without_password(params)
  #   else
  #     resource.update_with_password(params)
  #   end
  # end


  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :profile_picture, :password, :password_confirmation])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email, :profile_picture, :password, :password_confirmation])
  end

  

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  # def user_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :profile_picture, :current_password, :password, :password_confirmation)
  # end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_picture, :current_password, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :profile_picture, :password, :password_confirmation)
  end

  def password_update_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

end
