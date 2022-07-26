class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, 
          :registerable,
          :recoverable, 
          :rememberable, 
          :validatable,
          :confirmable

  scope :passed_with_level, ->(level) { results.joins(:test).where('tests.level = :level', level: level).count(:test_id) }
  scope :passed_at_once, ->(test) { results.where(test: test, passed: true).count(:test_id) }
  scope :passed_with_category, -> (category) { connection.select_one("SELECT 
                                                                      COUNT(DISTINCT TESTS.id) AS TESTS_IN_CATEGORY,
                                                                      COUNT(DISTINCT RESULTS.ID) AS PASSED_TESTS_IN_CATEGORY
                                                                      FROM tests
                                                                      LEFT JOIN results ON results.test_id = tests.id
                                                                      AND results.user_id = #{id}
                                                                      WHERE tests.category_id = #{category.id}
                                                                      GROUP BY TESTS.category_id") }

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
    results.where(test:).where.not(current_question: nil).first
  end
end
