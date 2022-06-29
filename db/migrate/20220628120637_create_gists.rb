class CreateGists < ActiveRecord::Migration[7.0]
  def change
    create_table :gists do |t|
      t.id :string, limit: 50
      t.string :description
      t.string :content
      t.boolean :public
      t.references :question, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
