class AddCurrentQuestionAndRightQuestionsToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference(:results, :current_qst, optional: true, foreign_key: { to_table: 'questions' })
    add_column(:results, :total, :integer, default: 0)
  end
end
