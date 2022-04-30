class Test < ApplicationRecord
  has_many :results
  has_many :users, through: :results
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :title, presence: true,
                    uniqueness: true

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: (0..1)) }
  scope :normal, -> { where(level: (2..5)) }
  scope :hard, -> { where(level: (5..)) }

  scope :find_by_title, -> (str) { joins(:category).where('categories.title like :str', str: "%#{str}%").order('title DESC') }
end
