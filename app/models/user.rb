 class User < ApplicationRecord
  has_many :tests_by_me, class_name: "Test", foreign_key: "author_id"
  has_many :results
  has_many :tests, through: :results

  validates :email, presence: true, uniqueness: true
  validate :validate_email_format
  validates :name, presence: true
  
  has_secure_password

  def my_tests(level = nil)
    tests.where('tests.level = :level or :level is null', level: level)
  end

  def test_passing(test)
    results.where(test: test).where.not(current_question: nil).first
  end

  private 

  def validate_email_format
    errors.add :email, 'incorrect format' if email !~ URI::MailTo::EMAIL_REGEXP #/\A[\w+-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  end
end
