class AddIndexToGists < ActiveRecord::Migration[7.0]
  def change
    add_index(:gists, %i[question_id author_id], unique: true)
  end
end
