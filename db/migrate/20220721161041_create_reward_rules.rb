class CreateRewardRules < ActiveRecord::Migration[7.0]
  def change
    create_table :reward_rules do |t|
      t.string :title, null: false
      t.string :leftValue
      t.string :comparsion
      t.string :rightValue
      t.string :additional

      t.timestamps
    end
  end
end
