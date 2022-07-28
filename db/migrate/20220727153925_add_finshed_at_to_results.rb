class AddFinshedAtToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :finished_at, :datetime
  end
end
