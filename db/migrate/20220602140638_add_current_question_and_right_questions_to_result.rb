class AddCurrentQuestionAndRightQuestionsToResult < ActiveRecord::Migration[7.0]
  def change
    add_reference(:results, :current_question, optional: true, foreign_key: { to_table: 'questions' })
    add_column(:results, :correct_questions, :integer, default: 0)
  end
end
