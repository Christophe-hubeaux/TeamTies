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
  password: '123456?',
  password_confirmation: '123456?',
  pseudo: 'Sylvain',
  department: 'IT'
)

user2 = User.create!(
  email: 'ch.hubeaux@gmail.com',
  password: 'test01', # 6 caractères minimum
  password_confirmation: 'test01',
  pseudo: 'Chris',
  department: 'IT'
)

user3 = User.create!(
  email: 'test@test.com',
  password: '123456', # 6 caractères minimum
  password_confirmation: '123456',
  pseudo: 'Mélissa',
  department: 'Ressources humaines'
)

user4 = User.create!(
  email: 'gabin@test.com',
  password: '123456', # 6 caractères minimum
  password_confirmation: '123456',
  pseudo: 'Gabin',
  department: 'Ressources humaines'
)

albania = Team.create!(name: 'Albania', flag: 'https://www.countryflags.com/wp-content/uploads/albania-albanian-flag-png-square-large.png')
austria = Team.create!(name: 'Austria', flag: 'https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-10-2048x1365.jpg')
belgium = Team.create!(name: 'Belgium', flag: 'https://www.countryflags.com/wp-content/uploads/flag-jpg-xl-18-2048x1775.jpg')
croatia = Team.create!(name: 'Croatia', flag: 'https://www.countryflags.com/wp-content/uploads/croatia-flag-png-large.png')
czechia = Team.create!(name: 'Czechia', flag: 'https://www.countryflags.com/wp-content/uploads/czech-republic-flag-png-large.png')
denmark = Team.create!(name: 'Denmark', flag: 'https://www.countryflags.com/wp-content/uploads/denmark-flag-png-large.png')
england = Team.create!(name: 'England', flag: 'https://www.countryflags.com/wp-content/uploads/england-flag-jpg-xl.jpg')
france = Team.create!(name: 'France', flag: 'https://www.countryflags.com/wp-content/uploads/france-flag-png-large.png')
germany = Team.create!(name: 'Germany', flag: 'https://www.countryflags.com/wp-content/uploads/germany-flag-png-large.png')
hungary = Team.create!(name: 'Hungary', flag: 'https://www.countryflags.com/wp-content/uploads/hungary-flag-png-large.png')
italy = Team.create!(name: 'Italy', flag: 'https://www.countryflags.com/wp-content/uploads/italy-flag-png-large.png')
netherlands = Team.create!(name: 'Netherlands', flag: 'https://www.countryflags.com/wp-content/uploads/netherlands-flag-png-large.png')
portugal = Team.create!(name: 'Portugal', flag: 'https://www.countryflags.com/wp-content/uploads/portugal-flag-400.png')
romania = Team.create!(name: 'Romania', flag: 'https://www.countryflags.com/wp-content/uploads/romania-flag-png-large.png')
scotland = Team.create!(name: 'Scotland', flag: 'https://www.countryflags.com/wp-content/uploads/scotland-flag-jpg-xl.jpg')
serbia = Team.create!(name: 'Serbia', flag: 'https://www.countryflags.com/wp-content/uploads/serbia-flag-png-large.png')
slovakia = Team.create!(name: 'Slovakia', flag: 'https://www.countryflags.com/wp-content/uploads/slovakia-flag-png-large.png')
slovenia = Team.create!(name: 'Slovenia', flag: 'https://www.countryflags.com/wp-content/uploads/slovenia-flag-png-large.png')
spain = Team.create!(name: 'Spain', flag: 'https://www.countryflags.com/wp-content/uploads/spain-flag-png-large.png')
switzerland = Team.create!(name: 'Switzerland', flag: 'https://www.countryflags.com/wp-content/uploads/switzerland-flag-png-large.png')
turkey = Team.create!(name: 'Türkiye', flag: 'https://www.countryflags.com/wp-content/uploads/turkey-flag-png-large.png')
playoffwinner = Team.create!(name: 'Play-Off Winner', flag: 'https://www.countryflags.com/wp-content/uploads/turkey-flag-png-large.png')

blueteam1 = Game.create!(name: 'Le Wagon - Batch 1598', code: 'A1B2C3')
# redteam1 = Game.create!(name: 'Équipe rouge')

UsersGame.create!(user: user1, game: blueteam1, total_score: 0)
UsersGame.create!(user: user2, game: blueteam1, total_score: 0)
UsersGame.create!(user: user3, game: blueteam1, total_score: 0)
UsersGame.create!(user: user4, game: blueteam1, total_score: 0)

match1 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: germany, away_team: scotland, date: Time.strptime('06/14/2024 18:00', '%m/%d/%Y %H:%M'))
match2 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: hungary, away_team: switzerland, date: Time.strptime('06/15/2024 15:00', '%m/%d/%Y %H:%M'))
match3 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: spain, away_team: croatia, date: Time.strptime('06/15/2024 18:00', '%m/%d/%Y %H:%M'))
match4 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: italy, away_team: albania, date: Time.strptime('06/15/2024 21:00', '%m/%d/%Y %H:%M'))
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
pronostic3 = Pronostic.create!(match: match2, user: user1, home_team_prono: 4, away_team_prono: 1, game: blueteam1, status: 'pending')
pronostic4 = Pronostic.create!(match: match2, user: user2, home_team_prono: 3, away_team_prono: 2, game: blueteam1, status: 'pending')
