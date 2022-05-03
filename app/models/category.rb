class Category < ApplicationRecord
  has_many :tests

  validates :title, presence: true

  scope :all_by_title, -> { order(:title) }
end
