class CreateResults < ActiveRecord::Migration[7.0]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
