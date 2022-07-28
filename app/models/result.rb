class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true

  before_create :before_create_set_qst
  before_update :before_update_next_qst
  before_update :before_update_check_final_results

  PASSING_LIMIT = 85

  def answered_questions
    test.questions.where('id < ?', current_question.id).count
  end

  def accept!(answer_id)
    self.correct_questions += 1 if current_question.answers.find(answer_id).correct
    save!
  end

  def completed?
    finished_at 
  end

  def success?
    score >= PASSING_LIMIT
  end

  private

  def before_create_set_qst
    self.current_question = test.questions.first if test.present? && current_question.nil?
  end

  def before_update_next_qst
    self.current_question = test.questions.where('id > ?', current_question.id).order(:id).first if test.present? && !completed?
  end

  def before_update_check_final_results    
    
    #if current_question is nil, means those was the last question and this test has been completed in time
    self.finished_at = Time.now unless current_question
    
    if completed? 
      self.score = (self.correct_questions.to_f / test.questions.count * 100)
      self.passed = success?
    end
  end
end
