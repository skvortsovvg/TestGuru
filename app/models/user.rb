class User < ApplicationRecord
  def my_tests(level)
    # select DISTINCT tests.title from results inner join tests on tests.id = results.test_id and results.user_id = 1;
    Result.joins(:tests).where(user_id: self.id, level: level)
  end
end
