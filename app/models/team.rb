class Team < ApplicationRecord
  has_many :players, class_name: 'Player'
  has_many :team_matches, class_name: 'TeamMatch'
end