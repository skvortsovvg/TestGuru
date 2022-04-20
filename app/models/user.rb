class User < ApplicationRecord
  def my_tests(level = nil)
    # select DISTINCT tests.title from results inner join tests on tests.id = results.test_id and results.user_id = 1 and tests.level = 1;
    Test.joins("inner join results on tests.id = results.test_id").where("results.user_id = :user_id and (tests.level = :level or :level is null)", user_id: self.id, level: level).distinct.pluck
  end
end
