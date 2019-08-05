class PlayerResult < ApplicationRecord
  belongs_to :player
  belongs_to :match

  def self.top_by_result_one_team(team_id, result_name, players_amount = 5)
    top_players_ids = Team.joins(players: :player_results)
                          .where('players.team_id = ? AND player_results.name = ?', team_id, result_name)
                          .group('player_results.player_id')
                          .count('player_results.name')
                          .keys.sort.reverse[0...players_amount]
    top_players_ids.inject([]) { |acc, id| acc << Player.find_by(id: id) }
  end

  def self.top_by_result_all_teams(result_name, players_amount = 5)
    top_players_ids = PlayerResult.where('player_results.name = ?', result_name)
                                  .group('player_results.player_id')
                                  .count('player_results.name')
                                  .keys.sort.reverse[0...players_amount]
    top_players_ids.inject([]) { |acc, id| acc << Player.find_by(id: id) }
  end
end