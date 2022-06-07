class TestsController < ApplicationController
  before_action :set_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show
    redirect_to test_questions_path(@test)
  end

  def new
  end

  def start    
    @user = User.first
    @user.tests << @test if @user.test_passing(@test).nil?
    redirect_to @user.test_passing(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
