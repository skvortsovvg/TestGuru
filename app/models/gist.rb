class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :author, class_name: "User"

  validates :question, presence: true, uniqueness: { scope: :author }

  before_create :create_gist_on_gitgub

  private 

  def create_gist_on_gitgub
    self.id = GistQuestionService.new.create_gist(self).id
  end

end
