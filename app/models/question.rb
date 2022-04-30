class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_count

  private 

  def validate_answers_count
    errors.add(:Question, "must has from 1 to 4 answers") if !(1..4).include?(answers.count) 
  end
end
