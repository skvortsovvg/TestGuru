 class User < ApplicationRecord
  has_many :tests_by_me, class_name: "Test", foreign_key: "author_id"
  has_many :results
  has_many :tests, through: :results

  validates :name, :email, presence: true
  
  def my_tests(level = nil)
    tests.where('tests.level = :level or :level is null', level: level)
  end

  def test_passing(test)
    results.where(test: test).where.not(current_qst: nil).first
  end
end
