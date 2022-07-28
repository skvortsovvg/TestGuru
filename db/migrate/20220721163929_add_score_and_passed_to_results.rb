class AddScoreAndPassedToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :score, :float, default: 0
    add_column :results, :passed, :boolean, default: false
  end
end
