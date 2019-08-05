class Match < ApplicationRecord
  has_many :tea
  has_many :team_matches
end