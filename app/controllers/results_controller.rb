class ResultsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_result
  before_action :set_gist, only: [:show, :gist]

  def show; end

  def finish; end

  def update
    if params[:answer_id].blank?
      redirect_to(@result, alert: t('.alert_make_choise')) 
    else
      @result.accept!(params[:answer_id])
      if @result.completed?
        redirect_to finish_result_path(@result)
      else
        render :show
      end
    end
  end

  def gist
    return if @gist
    answer = GistQuestionService.new.create_gist(@result)
    flash[answer[:key]] = answer[:value]
    redirect_to @result
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end
  def set_gist
    @gist = Gist.find_by(question: @result.current_question, author: current_user)
  end
end
