class TestsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_test, only: %i[show start destroy]

  def index
    @tests = Test.all
  end

  def show
    redirect_to test_questions_path(@test)
  end

  def new
    @test = current_user.tests_by_me.new
  end

  def create
    @test = current_user.tests_by_me.new(test_params)

    if @test.save
      redirect_to test_path(@test), notice: "New test was successfully created."
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to root_path, alert: "Тест был удален"
  end

  def start
    current_user.tests << @test unless current_user.test_passing(@test)
    redirect_to current_user.test_passing(@test)
  end

  private

  def test_params
     params.require(:test).permit(:title, :category_id, :level)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
