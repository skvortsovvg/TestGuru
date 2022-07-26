class CreateBadges < ActiveRecord::Migration[7.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image, default: "badges/_default.svg"
      t.references :reward_rule, foreign_key: true
      t.timestamps
    end
  end
end
