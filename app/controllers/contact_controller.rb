class ContactController < ApplicationController
  def new
    render 'application/contact'
  end

  def create
    ApplicationMailer.new.mail(to: current_user.email, 
                          subject: "Обращение пользователя TestGuru",
                          body: params[:message]).deliver!
    redirect_to root_path, notice: "Ваше сообщение отправлено!"
  end
end
