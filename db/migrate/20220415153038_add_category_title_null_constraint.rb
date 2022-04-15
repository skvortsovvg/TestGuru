class AddCategoryTitleNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:categories, :title, false)
  end
end
