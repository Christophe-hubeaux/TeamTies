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
  email: 'a3e7d6@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  pseudo: 'gemmers',
  department: 'IT'
)

user2 = User.create!(
  email: 'ch.hubeaux@gmail.com',
  password: 'test01', # 6 caractères minimum
  password_confirmation: 'test01',
  pseudo: 'Chris',
  department: 'IT'
)

albania = Team.create!(name: 'Albania', flag: 'flag_albania')
austria = Team.create!(name: 'Austria', flag: 'flag_austria')
belgium = Team.create!(name: 'Belgium', flag: 'flag_belgium')
croatia = Team.create!(name: 'Croatia', flag: 'flag_croatia')
czechia = Team.create!(name: 'Czechia', flag: 'flag_czechia')
denmark = Team.create!(name: 'Denmark', flag: 'flag_denmark')
england = Team.create!(name: 'England', flag: 'flag_england')
france = Team.create!(name: 'France', flag: 'flag_france')
germany = Team.create!(name: 'Germany', flag: 'flag_germany')
hungary = Team.create!(name: 'Hungary', flag: 'flag_hungary')
italy = Team.create!(name: 'Italy', flag: 'flag_italy')
netherlands = Team.create!(name: 'Netherlands', flag: 'flag_netherlands')
portugal = Team.create!(name: 'Portugal', flag: 'flag_portugal')
romania = Team.create!(name: 'Romania', flag: 'flag_romania')
scotland = Team.create!(name: 'Scotland', flag: 'flag_scotland')
serbia = Team.create!(name: 'Serbia', flag: 'flag_serbia')
slovakia = Team.create!(name: 'Slovakia', flag: 'flag_slovakia')
slovenia = Team.create!(name: 'Slovenia', flag: 'flag_slovenia')
spain = Team.create!(name: 'Spain', flag: 'flag_spain')
switzerland = Team.create!(name: 'Switzerland', flag: 'flag_switzerland')
turkey = Team.create!(name: 'Türkiye', flag: 'flag_turkey')
playoffwinner = Team.create!(name: 'Play-Off Winner', flag: 'flag_turkey')

blueteam1 = Game.create!(name: 'Équipe bleue')

usergame1 = UsersGame.create!(user: user1, game: blueteam1, total_score: 0)
usergame1 = UsersGame.create!(user: user2, game: blueteam1, total_score: 0)

match1 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: germany, away_team: scotland, date: Date.parse('2024-06-14 22:00:00'))
# match2 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: hungary, away_team: switzerland, date: Date.parse('2024-06-15 16:00:00'))
# match3 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: spain, away_team: croatia, date: Date.parse('2024-06-15 19:00:00'))
# match4 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: italy, away_team: albania, date: Date.parse('2024-06-15 22:00:00'))
# match5 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: playoffwinner, away_team: netherlands, date: Date.parse('2024-06-16 16:00:00'))
# match6 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: slovenia, away_team: denmark, date: Date.parse('2024-06-16 18:00:00'))
# match7 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: serbia, away_team: england, date: Date.parse('2024-06-16 21:00:00'))
# match8 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: romania, away_team: playoffwinner, date: Date.parse('2024-06-17 15:00:00'))
# match9 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: belgium, away_team: slovakia, date: Date.parse('2024-06-17 18:00:00'))
# match10 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: austria, away_team: france, date: Date.parse('2024-06-17 21:00:00'))
# match11 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: turkey, away_team: playoffwinner, date: Date.parse('2024-06-18 18:00:00'))
# match12 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: portugal, away_team: czechia, date: Date.parse('2024-06-18 21:00:00'))

pronostic1 = Pronostic.create!(match: match1, user: user1, home_team_prono: 2, away_team_prono: 1, game: blueteam1, status: 'pending')
pronostic2 = Pronostic.create!(match: match1, user: user2, home_team_prono: 0, away_team_prono: 3, game: blueteam1, status: 'pending')
