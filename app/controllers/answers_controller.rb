class AnswersController < ApplicationController
  before_action :set_answer, only: %i[ show edit update destroy ] 
  before_action :set_question, only: %i[ new create ]

  def show
  end

  def new
    @answer = @question.answers.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        redirect_to answer_url(@answer), notice: "Answer was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /answers/1
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        redirect_to answer_url(@answer), notice: "Answer was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /answers/1
  def destroy
    @answer.destroy

    respond_to do |format|
      redirect_to answers_url, notice: "Answer was successfully destroyed." 
    end
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