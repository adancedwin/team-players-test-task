# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
RESULTS = %w[
  70_percent_pass_accuracy
  90_percent_pass_accuracy
  run_five_km
  run_ten_km
].freeze

4.times { Team.create(name: Faker::Sports::Football.team) }

team_ids = Team.last(4).map(&:id)
10.times do
  Player.create(
    name: Faker::Sports::Football.player,
    team_id: team_ids[0]
  )
end
10.times do
  Player.create(
    name: Faker::Sports::Football.player,
    team_id: team_ids[1]
  )
end
10.times do
  Player.create(
    name: Faker::Sports::Football.player,
    team_id: team_ids[2]
  )
end
10.times do
  Player.create(
    name: Faker::Sports::Football.player,
    team_id: team_ids[3]
  )
end

8.times { Match.create(name: Faker::Sports::Football.competition) }

matches_ids = Match.all.map(&:id)

8.times do |num|
  two_teams_ids = team_ids.sample(2)
  TeamMatch.create(
    match_id: matches_ids[num],
    team_id: two_teams_ids.first
  )
  TeamMatch.create(
    match_id: matches_ids[num],
    team_id: two_teams_ids.last
  )
end

players_ids = Player.all.map(&:id)
matches_ids = Match.all.map(&:id)
35.times do
  match_id = matches_ids.sample
  player_id = players_ids.sample
  while PlayerResult.where('match_id = ? AND player_id = ?', match_id, player_id).any?
    match_id = matches_ids.sample
    player_id = players_ids.sample
  end
  PlayerResult.create(
    name: RESULTS.sample,
    match_id: matches_ids.sample,
    player_id: players_ids.sample
  )
end

puts 'Seeding is done'