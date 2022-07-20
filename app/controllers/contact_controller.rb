class ContactController < ApplicationController
  def new
    render 'application/contact'
  end

  def create
    if params[:message] then
      ApplicationMailer.new.mail(to: current_user.email, 
                            subject: "Обращение пользователя TestGuru",
                            body: params[:message]).deliver!
      redirect_to root_path, notice: "Ваше сообщение отправлено!"
    else
      redirect_to :new,  alert: 'Пустое сообщение, напишите что-нибудь'
    end
  end
end
