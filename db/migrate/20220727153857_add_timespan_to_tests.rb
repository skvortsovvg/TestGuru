class AddTimespanToTests < ActiveRecord::Migration[7.0]
  def change
    add_column :tests, :timespan, :integer, default: 0
  end
end
