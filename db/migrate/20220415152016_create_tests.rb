class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
