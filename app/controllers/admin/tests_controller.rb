class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show start destroy]

  def index
    @tests = Test.all
  end

  def show
    redirect_to admin_test_questions_path(@test)
  end

  def new
    @test = current_user.tests_by_me.new
  end

  def create
    @test = current_user.tests_by_me.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: "New test was successfully created."
    else
      render :new
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path, alert: "Тест был удален"
  end

  private

  def test_params
     params.require(:test).permit(:title, :category_id, :level)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
