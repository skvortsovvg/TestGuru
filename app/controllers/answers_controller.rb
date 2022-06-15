class AnswersController < ApplicationController
  before_action :authenticate!
  before_action :set_answer, only: %i[show edit update destroy]
  before_action :set_question, only: %i[new create]

  def show; end

  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit; end

  # POST /answers
  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to answer_url(@answer), notice: "Answer was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /answers/1
  def update
    if @answer.update(answer_params)
      redirect_to answer_url(@answer), notice: "Answer was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy
    redirect_to answers_url, notice: "Answer was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
