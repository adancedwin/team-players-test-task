class Match < ApplicationRecord
  belongs_to :first_team, class_name: 'Team', foreign_key: :first_team_id
  belongs_to :second_team, class_name: 'Team', foreign_key: :second_team_id
  has_many :player_results
end