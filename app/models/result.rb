class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_qst, class_name: "Question", optional: true

  before_create :before_create_set_qst
  before_update :before_update_next_qst

  def answered_questions()
    test.questions.where('id < ?', current_qst.id).count
  end

  def accept!(answer_id)
    if current_qst.answers.find(answer_id).correct then
      self.total += 1
    end
    save!
  end

  def completed?
    current_qst.nil?
  end
  
  def resume
    self.total.to_f / test.questions.count * 100
  end

  private

  def before_create_set_qst()
    self.current_qst = test.questions.first if test.present? && current_qst.nil? 
  end
  def before_update_next_qst()
    self.current_qst = test.questions.where('id > ?', current_qst.id).order(:id).first if test.present? && !current_qst.nil? 
  end
end
