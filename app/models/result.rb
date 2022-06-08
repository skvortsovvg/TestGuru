class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_question, class_name: "Question", optional: true

  before_create :before_create_set_qst
  before_update :before_update_next_qst

  PASSING_LIMIT = 85
  
  def answered_questions
    test.questions.where('id < ?', current_question.id).count
  end

  def accept!(answer_id)
    if current_question.answers.find(answer_id).correct
      self.correct_questions += 1
    end
    save!
  end

  def completed?
    current_question.nil?
  end
  
  def success?
    result >= PASSING_LIMIT
  end

  def result
    (self.correct_questions.to_f / test.questions.count * 100)
  end

  private

  def before_create_set_qst
    self.current_question = test.questions.first if test.present? && self.completed? 
  end
  def before_update_next_qst
    self.current_question = test.questions.where('id > ?', current_question.id).order(:id).first if test.present? && !self.completed? 
  end
end
