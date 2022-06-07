class ResultsController < ApplicationController
  before_action :set_result, only: %i[show update finish]

  def show  
  end

  def finish
  end

  def update
    if params[:answer_id].present?
         @result.accept!(params[:answer_id])
        if @result.completed?
          redirect_to finish_result_path(@result)
        else 
          render :show
        end
    end          
  end

  private

  def set_result
    @result = Result.find(params[:id])
  end

end
