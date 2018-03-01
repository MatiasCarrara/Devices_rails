class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  helper_method :current_user

  def not_found
    render 'error/error', status: 404
  end
  def current_user
    if @user
      @current_user ||= User.find(params[:id])
    else
      @current_user ||= User.find(params[:user_id])
    end
  end

end
