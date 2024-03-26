class CreateIncrementTotalScores < ActiveRecord::Migration[7.1]
  def change
    create_table :increment_total_scores do |t|

      t.timestamps
    end
  end
end
