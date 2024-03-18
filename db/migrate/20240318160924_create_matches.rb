class CreateMatches < ActiveRecord::Migration[7.1]
  def change
    create_table :matches do |t|
      t.string :group
      t.string :stage
      t.string :tournament
      t.references :home_team, null: false, foreign_key: {to_table: :teams}
      t.references :away_team, null: false, foreign_key: {to_table: :teams}
      t.date :date
      t.integer :home_team_result
      t.integer :away_team_result

      t.timestamps
    end
  end
end
