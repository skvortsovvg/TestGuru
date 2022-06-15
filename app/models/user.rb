class User < ApplicationRecord
  has_many :tests_by_me, class_name: "Test", foreign_key: "author_id"
  has_many :results
  has_many :tests, through: :results

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :name, presence: true

  has_secure_password

  def my_tests(level = nil)
    tests.where('tests.level = :level or :level is null', level:)
  end

  def test_passing(test)
    results.where(test:).where.not(current_question: nil).first
  end
end
