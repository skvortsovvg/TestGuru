class TestsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  before_action :set_test, only: %i[start]

  def index
    # @tests = Test.left_joins(:questions).group(:id).having('COUNT(DISTINCT questions.id) > 0')
    @tests = Test.where(is_active: true)
  end
  
  def start
    current_user.tests << @test unless current_user.test_passing(@test)
    redirect_to current_user.test_passing(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
