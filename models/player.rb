class Player < ApplicationRecord
  belongs_to :team
  has_many :player_results
  
  def self.achieved_result_in_last_matches?(player, result, matches = 5)
    last_matches = player.team.matches.order(id: :desc).limit(matches).map(&:id)
    player.player_results.where('match_id = ? AND result = ?', last_matches, result).any?
  end
end