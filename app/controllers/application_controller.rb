class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user

  private

  def authenticate!
    unless current_user
      cookies[:direction] = request.original_url
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
