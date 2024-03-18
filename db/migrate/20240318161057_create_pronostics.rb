class CreatePronostics < ActiveRecord::Migration[7.1]
  def change
    create_table :pronostics do |t|
      t.references :match, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :home_team_prono
      t.integer :away_team_prono
      t.references :game, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
