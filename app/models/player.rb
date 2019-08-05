class Player < ApplicationRecord
  belongs_to :team
  has_many :player_results
  
  def achieved_result_in_last_matches?(result_name, matches_quantity = 5)
    return unless self.team.matches
    last_matches = self.team.matches.order(id: :desc).limit(matches).map(&:id)
    self.player_results.where('player_results.match_id = ? AND player_results.name = ?', last_matches, result_name).any?
  end
end
