class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, only: :create, if: :devise_controller?
  after_action  :hello, only: :create, if: Proc.new { is_a?(::Devise::SessionsController) }
  before_action :switch_locale

  def about
  end

  def contact
  end

  def send_contact
      ApplicationMailer.new.mail(to: params[:email], 
                            subject: "Обращение пользователя TestGuru",
                            body: params[:message]).deliver!
      redirect_to root_path, notice: "Ваше сообщение отправлено!"
  end

  protected

  def switch_locale
    I18n.locale = params_locale unless I18n.locale.to_s == params_locale
  end

  def params_locale
    (params[:locale] if !params[:locale]&.empty?) || I18n.default_locale
  end

  def default_url_options
    { locale: (I18n.locale unless I18n.locale == I18n.default_locale ) }
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || resource.admin? ? admin_tests_path : root_path
  end

  def hello
    flash[:primary] = "#{t('hello')}, #{current_user.first_name.capitalize}!"
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
