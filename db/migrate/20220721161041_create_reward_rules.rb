class CreateRewardRules < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_rules do |t|
      t.string :title, null: false
      t.string :left_value
      t.string :comparsion
      t.string :right_value
      t.string :additional

      t.timestamps
    end
  end
end
