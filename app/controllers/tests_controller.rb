class TestsController < ApplicationController
  before_action :set_test, only: %i[show]

  def index
    @tests = Test.all
  end

  def show
    redirect_to test_questions_path(@test)
  end

  def new
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

end
