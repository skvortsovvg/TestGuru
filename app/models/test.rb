class Test < ApplicationRecord
  def self.find_by_title(str)
    self.pluck('title').where("title LIKE %:param%", param: str).order('title DESC')
  end
end
