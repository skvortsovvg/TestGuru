class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  scope :right_aswers, -> { where(correct: true) }
end
