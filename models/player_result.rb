class PlayerResult < ApplicationRecord
  belongs_to :player
  belongs_to :matches

  def self.top_by_result_one_team(team, result, players_amount = 5)
    players_by_result = team.players.joins(:players_results).where('result = ?', result)
    top_players_ids = players_by_result.group(:player_id).count(:result).keys.sort.reverse[0...players_amount]
    top_players_ids.inject([]) { |acc, id| acc << Player.find_by(id: id) }
  end

  def self.top_by_result_all_teams(result, players_amount = 5)
    players_by_result = PlayerResult.where('result = ?', result)
    top_players_ids = players_by_result.group(:player_id).count(:result).keys.sort.reverse[0...players_amount]
    top_players_ids.inject([]) { |acc, id| acc << Player.find_by(id: id) }
  end
end