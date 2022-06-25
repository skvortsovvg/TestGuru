class Test < ApplicationRecord
  has_many :results, dependent: :destroy
  has_many :users, through: :results
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates :title, presence: true, uniqueness: { scope: :level }

  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: (0..1)) }
  scope :normal, -> { where(level: (2..5)) }
  scope :hard, -> { where(level: (5..)) }

  scope :by_category, ->(str) { joins(:category).where('categories.title like :str', str: "%#{str}%") }

  def level_represent
    return :easy if level <= 1
    return :normal if (2..5).include?(level)
    return :hard
  end

  def self.find_by_title_category(str)
    by_category(str).order("tests.title DESC").pluck("tests.title")
  end
end
