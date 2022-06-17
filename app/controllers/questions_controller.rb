class QuestionsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_test, only: %i[index new create]
  before_action :set_question, only: %i[show edit destroy update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_qst_not_found

  def index; end

  def show; end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to @question.test
    else
      render plain: @question.errors.full_messages
    end
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to question.test
    else
      render plain: question.errors.full_messages
    end
  end

  def new
    @question = @test.questions.new
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path(@question.test), notice: "Вопрос был удален"
  end

  private

  def rescue_with_qst_not_found
    render plain: "Question was not found"
  end

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
