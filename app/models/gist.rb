class Gist < ApplicationRecord
  belongs_to :question
  belongs_to :author, class_name: "User"

  validates :question, presence: true, uniqueness: { scope: :author }
  validates :gist_id, presence: true, uniqueness: true

  def initialize(args)
    super
    create_gist_on_gitgub
  end

  private 

  def create_gist_on_gitgub
    new_gist = GistQuestionService.new
    self.gist_id = new_gist.create_gist(self).id
    unless new_gist.client.last_response.status == 201
      errors.add(:gist_id, "Ошибка при запросе на GitHub")
    end
  end

end
