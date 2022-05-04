class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count

  scope :right_aswers, -> { where(correct: true) }

  private 

  def validate_answers_count
    errors.add(:Question, "already has 4 answers") if question.answers.count >= 4 
  end

end
