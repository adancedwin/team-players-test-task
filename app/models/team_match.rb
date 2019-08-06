class TeamMatch < ApplicationRecord
  belongs_to :team, class_name: 'Team'
  belongs_to :match, class_name: 'Match'
end