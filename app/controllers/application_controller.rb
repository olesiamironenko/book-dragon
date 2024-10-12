class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]
  

  private
  def set_current_user
    if session[:current_user]
      @current_user = User.find(session[:current_user])
    else
      @current_user = nil
    end
  end
  
end
