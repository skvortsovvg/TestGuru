class Test < ApplicationRecord
  has_many :results
  has_many :users, through: :results
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: "User"

  def self.find_by_title(str)
    self.joins(:category).where('categories.title like :str', str: "%#{str}%").order('title DESC')
  end
end
