class AddTestsLevelSetDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default(:tests, :level, from: nil, to: 1)
  end
end
