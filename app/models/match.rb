class Match < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :away_team, class_name: 'Team'
  has_many :pronostics, dependent: :destroy
  STAGES = ["phase de groupes", "huitième de finale", "quart de finale", "demi-finale", "finale"]
end
