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

    gist = Gist.new(
      question: @result.current_question, 
      author: @result.user,
      content: "#{@result.current_question.body}\n" + @result.current_question.answers.pluck(:body).join("\n"),
      description: t('.gist_discription'),
      public: true)

    if gist.errors.any? || !gist.save
      flash[:alert] = gist.errors.full_messages.join("\n") 
    else 
      flash[:success] = "#{t('.new_gist')}:  #{ view_context.link_to(gist.gist_id, "https://gist.github.com/#{gist.gist_id}", target: '_blank') }" 
    end
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
