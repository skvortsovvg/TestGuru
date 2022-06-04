class Result < ApplicationRecord
  belongs_to :test
  belongs_to :user
  belongs_to :current_qst, class_name: "Question", optional: true
end
