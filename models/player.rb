class Player < ApplicationRecord
  belongs_to :team
  has_many :player_results
  
  def achieved_result_in_last_matches?(result, matches = 5)
    return unless self.team.matches
    last_matches = self.team.matches.order(id: :desc).limit(matches).map(&:id)
    player.player_results.where('match_id = ? AND result = ?', last_matches, result).any?
  end
end
