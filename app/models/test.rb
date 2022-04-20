class Test < ApplicationRecord
  def self.find_by_title(str)
    # select * from tests inner join categories on tests.category_id = categories.id and categories.title like "%end%"
    self.joins('join categories on tests.category_id = categories.id').where('categories.title like :str', str: "%#{str}%").order('title DESC')
  end
end
