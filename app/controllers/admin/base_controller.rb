class Admin::BaseController < ApplicationController
  before_action :admin_require!

  private

  def admin_require!
    redirect_to root_path, notice: "You have to log in as administrator to view this page!" unless current_user.admin?
  end

end
