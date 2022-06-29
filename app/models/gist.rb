class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :author, class_name: "User"

  validates :question, presence: true, uniqueness: { scope: :author }
  validates :id, presence: true, uniqueness: true
end
