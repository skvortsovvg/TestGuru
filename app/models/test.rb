class Test < ApplicationRecord
  def self.find_by_title(str)
    self.where("title LIKE :param", param: "%#{str}%").order('title DESC').pluck(:title)
  end
end
