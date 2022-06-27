class ResultsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_result

  def show; end

  def finish; end

  def update
    return if params[:answer_id].blank?

    @result.accept!(params[:answer_id])
    if @result.completed?
      redirect_to finish_result_path(@result)
    else
      render :show
    end
  end

  def gist
    gist = Gist.new(
      question: @result.current_question, 
      author: @result.user,
      id: "brodi",
      content: @result.current_question.body + "\nШо делать?",
      description: "Такая хуйня",
      public: true)

    if gist.save
      flash[:success] = "Всё оке"
      render :show
    else 
      redirect_to @result
    end
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
end
