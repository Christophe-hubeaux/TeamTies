# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Pronostic.destroy_all
UsersGame.destroy_all
Match.destroy_all
Game.destroy_all
Team.destroy_all
User.destroy_all

user1 = User.create!(
  email: 'gemmers@test.com',
  password: '123456',
  password_confirmation: '123456',
  pseudo: 'gemmers',
  department: 'IT'
)

Team.create(name: 'Vatican', flag: 'flag_vatican')
Team.create(name: 'Monaco', flag: 'flag_monaco')
Team.create(name: 'Nauru', flag: 'flag_nauru')
Team.create(name: 'Tuvalu', flag: 'flag_tuvalu')
Team.create(name: 'Îles Marshall', flag: 'flag_marshall_islands')
Team.create(name: 'Russie', flag: 'flag_russia')
Team.create(name: 'Turks and Caicos Islands', flag: 'flag_turks_and_caicos')
Team.create(name: 'Cayman Islands', flag: 'flag_cayman_islands')
Team.create(name: 'San Marino', flag: 'flag_san_marino')
Team.create(name: 'British Virgin Islands', flag: 'flag_british_virgin_islands')
Team.create(name: 'Anguilla', flag: 'flag_anguilla')
Team.create(name: 'Bahamas', flag: 'flag_bahamas')
Team.create(name: 'Eritrea', flag: 'flag_eritrea')
Team.create(name: 'Gibraltar', flag: 'flag_gibraltar')
Team.create(name: 'Somalia', flag: 'flag_somalia')
Team.create(name: 'Tonga', flag: 'flag_tonga')

game1 = Game.create(name: 'Game1')

UsersGame.create(user: user1, game: game1, total_score: 0)

monaco = Team.find_by(name: 'Monaco')
russie = Team.find_by(name: 'Russie')
turks_and_caicos = Team.find_by(name: 'Turks and Caicos Islands')
cayman_islands = Team.find_by(name: 'Cayman Islands')
gibraltar = Team.find_by(name: 'Gibraltar')
vatican = Team.find_by(name: 'Vatican')

match1 = Match.create(group: 'A', stage: 'quart de final', tournament: 'Coupe du Monde 2024', home_team_id: monaco.id, away_team_id: turks_and_caicos.id, date: Date.today)
match2 = Match.create(group: 'B', stage: 'quart de final', tournament: 'Coupe du Monde 2024', home_team_id: russie.id, away_team_id: cayman_islands.id, date: Date.today + 1.day)
Match.create(group: 'C', stage: 'quart de final', tournament: 'Coupe du Monde 2024', home_team_id: gibraltar.id, away_team_id: vatican.id, date: Date.today + 2.day)

Pronostic.create(match_id: match1.id, user_id: user1.id, home_team_prono: 2, away_team_prono: 1, game_id: game1.id, status: 'pending')
Pronostic.create(match_id: match2.id, user_id: user1.id, home_team_prono: 0, away_team_prono: 3, game_id: game1.id, status: 'pending')
