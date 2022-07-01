class AddGistIdToGists < ActiveRecord::Migration[7.0]
  def change
    add_column(:gists, :gist_id, :string, limit: 50)
   add_index(:gists, :gist_id, unique: true)
  end
end
