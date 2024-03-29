class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable,
          :confirmable

  has_many :tests_by_me, class_name: "Test", foreign_key: "author_id"
 
  has_many :results
  has_many :tests, through: :results
 
  has_many :users_badges, dependent: :destroy
  has_many :badges, through: :users_badges

  validates :email, presence: true, uniqueness: true, format: URI::MailTo::EMAIL_REGEXP
  validates :first_name, presence: true

  def admin?
    self.is_a?(Admin)
  end

  def my_tests(level = nil)
    tests.where('tests.level = :level or :level is null', level:)
  end

  def test_passing(test)
    results.where(test: test, finished_at: nil).where.not(current_question: nil).first
  end
end
