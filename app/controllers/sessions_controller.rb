class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (cookies[:direction] ? cookies[:direction] : root_path)
    else
      flash.now[:alert] = 'Get out of here! Go register first.'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
