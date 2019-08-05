class Player < ApplicationRecord
  belongs_to :team
  has_many :player_results
  
  def achieved_result_in_last_matches?(result_name, matches_quantity = 5)
    return unless self.team.team_matches
    last_matches = self.team.team_matches.order(id: :desc).limit(matches_quantity).map(&:id)
    self.player_results.where('player_results.match_id in (?) AND player_results.name = ?', last_matches, result_name).any?
  end
end
