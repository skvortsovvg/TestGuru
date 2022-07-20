class AddIsActiveToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :is_active, :boolean
  end
end
