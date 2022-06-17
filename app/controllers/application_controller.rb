class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, only: [:create], if: :devise_controller?
  after_action  :hello, only: :create, if: Proc.new { is_a?(::Devise::SessionsController) }

  protected

  def hello
    flash[:alert] = "Привет, #{current_user.first_name.capitalize}!"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
