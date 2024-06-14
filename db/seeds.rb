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
Message.destroy_all
Chat.destroy_all
Department.destroy_all
Game.destroy_all
Team.destroy_all
User.destroy_all

user1 = User.create!(
  email: 'a3e7d6@gmail.com',
  password: '123456?',
  password_confirmation: '123456?',
  pseudo: 'Sylvain',
  admin: true
)

user2 = User.create!(
  email: 'ch.hubeaux@gmail.test',
  password: 'test01', # 6 caractères minimum
  password_confirmation: 'test01',
  pseudo: 'Chris',
  admin: true
)

user3 = User.create!(
  email: 'test@test.com',
  password: '123456', # 6 caractères minimum
  password_confirmation: '123456',
  pseudo: 'Mélissa',
  admin: true
)

user4 = User.create!(
  email: 'gabin@test.com',
  password: '123456', # 6 caractères minimum
  password_confirmation: '123456',
  pseudo: 'Gabin',
  admin: true
)

user5 = User.create!(
  email: 'user5@example.com',
  password: '123456', # Must be at least 6 characters
  password_confirmation: '123456',
  pseudo: 'Alex',
)

user6 = User.create!(
  email: 'user6@example.com',
  password: '123456', # Must be at least 6 characters
  password_confirmation: '123456',
  pseudo: 'Emily',
)

user7 = User.create!(
  email: 'user7@example.com',
  password: '123456', # Must be at least 6 characters
  password_confirmation: '123456',
  pseudo: 'Max',
)

user8 = User.create!(
  email: 'user8@example.com',
  password: '123456', # Must be at least 6 characters
  password_confirmation: '123456',
  pseudo: 'Sophie',
)

user9 = User.create!(
  email: 'user9@example.com',
  password: '123456',
  password_confirmation: '123456',
  pseudo: 'Lucas',
)

user10 = User.create!(
  email: 'user10@example.com',
  password: '123456',
  password_confirmation: '123456',
  pseudo: 'Emma',
)

user11 = User.create!(
  email: 'user11@example.com',
  password: '123456',
  password_confirmation: '123456',
  pseudo: 'Nathan',
)

user12 = User.create!(
  email: 'user12@example.com',
  password: '123456',
  password_confirmation: '123456',
  pseudo: 'Léa',
)

albania = Team.create!(name: 'Albanie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Albania_Flat_Round-128x128.png')
austria = Team.create!(name: 'Autriche', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Austria_Flat_Round-1-128x128.png')
belgium = Team.create!(name: 'Belgique', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Belgium_Flat_Round-128x128.png')
croatia = Team.create!(name: 'Croatie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Croatia_Flat_Round-128x128.png')
czechia = Team.create!(name: 'Rép. Tchèque', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Czech_Republic_Flat_Round-128x128.png')
denmark = Team.create!(name: 'Danemark', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Denmark_Flat_Round-128x128.png')
england = Team.create!(name: 'Angleterre', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_England_Flat_Round-128x128.png')
france = Team.create!(name: 'France', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_France_Flat_Round-128x128.png')
germany = Team.create!(name: 'Allemagne', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Germany_Flat_Round-128x128.png')
hungary = Team.create!(name: 'Hongrie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Hungary_Flat_Round-128x128.png')
italy = Team.create!(name: 'Italie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Italy_Flat_Round-128x128.png')
netherlands = Team.create!(name: 'Pays-Bas', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Netherlands_Flat_Round-128x128.png')
portugal = Team.create!(name: 'Portugal', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Portugal_Flat_Round-128x128.png')
romania = Team.create!(name: 'Romanie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Romania_Flat_Round-128x128.png')
scotland = Team.create!(name: 'Ecosse', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Scotland_Flat_Round-128x128.png')
serbia = Team.create!(name: 'Serbie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Serbia_Flat_Round-128x128.png')
slovakia = Team.create!(name: 'Slovaquie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Slovakia_Flat_Round-128x128.png')
slovenia = Team.create!(name: 'Slovénie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Slovenia_Flat_Round-128x128.png')
spain = Team.create!(name: 'Espagne', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Spain_Flat_Round-128x128.png')
switzerland = Team.create!(name: 'Suisse', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Switzerland_Flat_Round-128x128.png')
turkey = Team.create!(name: 'Turquie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Turkey_Flat_Round-128x128.png')
georgia = Team.create!(name: 'Géorgie', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Georgia_Flat_Round-128x128.png')
ukraine = Team.create(name: 'Ukraine', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Ukraine_Flat_Round-128x128.png')
poland = Team.create!(name: 'Pologne', flag: 'https://flagdownload.com/wp-content/uploads/Flag_of_Poland_Flat_Round-128x128.png')

blueteam1 = Game.create!(name: 'TechSolution .Inc', code: 'A1B2C3')
blueteam1_chat = Chat.create!(name: blueteam1.name, game: blueteam1)
# redteam1 = Game.create!(name: 'Équipe rouge')

dept1 = Department.create!(name: "IT", game: blueteam1)
dept2 = Department.create!(name: "Compta", game: blueteam1)
dept3 = Department.create!(name: "RH", game: blueteam1)
dept4 = Department.create!(name: "R&D", game: blueteam1)
dept5 = Department.create!(name: "Marketing", game: blueteam1)
dept6 = Department.create!(name: "Ventes", game: blueteam1)

UsersGame.create!(user: user1, game: blueteam1, total_score: 15, department: dept1)
# UsersGame.create!(user: user2, game: blueteam1, total_score: 8, department: dept1)
UsersGame.create!(user: user3, game: blueteam1, total_score: 22, department: dept2)
UsersGame.create!(user: user4, game: blueteam1, total_score: 21, department: dept4)
UsersGame.create!(user: user5, game: blueteam1, total_score: 18, department: dept5)
UsersGame.create!(user: user6, game: blueteam1, total_score: 15, department: dept3)
UsersGame.create!(user: user7, game: blueteam1, total_score: 24, department: dept6)
UsersGame.create!(user: user8, game: blueteam1, total_score: 27, department: dept4)
UsersGame.create!(user: user9, game: blueteam1, total_score: 15, department: dept1)
UsersGame.create!(user: user10, game: blueteam1, total_score: 8, department: dept3)
UsersGame.create!(user: user11, game: blueteam1, total_score: 22, department: dept2)
UsersGame.create!(user: user12, game: blueteam1, total_score: 21, department: dept6)

match1 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: germany, away_team: scotland, date: DateTime.strptime('06/14/2024 21:00', '%m/%d/%Y %H:%M'))
match2 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: hungary, away_team: switzerland, date: DateTime.strptime('06/15/2024 15:00', '%m/%d/%Y %H:%M'))
match3 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: spain, away_team: croatia, date: DateTime.strptime('06/15/2024 18:00', '%m/%d/%Y %H:%M'))
match4 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: italy, away_team: albania, date: DateTime.strptime('06/15/2024 21:00', '%m/%d/%Y %H:%M'))
match5 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: poland, away_team: netherlands, date: DateTime.strptime('06/16/2024 15:00', '%m/%d/%Y %H:%M'))
match6 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: slovenia, away_team: denmark, date: DateTime.strptime('06/16/2024 18:00', '%m/%d/%Y %H:%M' ))
match7 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: serbia, away_team: england, date: DateTime.strptime('06/16/2024 21:00', '%m/%d/%Y %H:%M'))
match8 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: romania, away_team: ukraine, date: DateTime.strptime('06/17/2024 15:00', '%m/%d/%Y %H:%M'))
match9 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: belgium, away_team: slovakia, date: DateTime.strptime('06/17/2024 18:00', '%m/%d/%Y %H:%M'))
match10 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: austria, away_team: france, date: DateTime.strptime('06/17/2024 21:00', '%m/%d/%Y %H:%M'))
match11 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: turkey, away_team: georgia, date: DateTime.strptime('06/18/2024 18:00', '%m/%d/%Y %H:%M'))
match12 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: portugal, away_team: czechia, date: DateTime.strptime('06/18/2024 21:00', '%m/%d/%Y %H:%M'))
match13 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: croatia, away_team: albania, date: DateTime.strptime('06/19/2024 15:00', '%m/%d/%Y %H:%M'))
match14 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: germany, away_team: hungary, date: DateTime.strptime('06/19/2024 18:00', '%m/%d/%Y %H:%M'))
match15 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: scotland, away_team: switzerland, date: DateTime.strptime('06/19/2024 21:00', '%m/%d/%Y %H:%M'))
match16 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: slovenia, away_team: serbia, date: DateTime.strptime('06/20/2024 15:00', '%m/%d/%Y %H:%M'))
match17 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: denmark, away_team: england, date: DateTime.strptime('06/20/2024 18:00', '%m/%d/%Y %H:%M'))
match18 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: spain, away_team: italy, date: DateTime.strptime('06/20/2024 21:00', '%m/%d/%Y %H:%M'))
match19 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: slovakia, away_team: ukraine, date: DateTime.strptime('06/21/2024 15:00', '%m/%d/%Y %H:%M'))
match20 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: poland, away_team: austria, date: DateTime.strptime('06/21/2024 18:00', '%m/%d/%Y %H:%M'))
match21 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: netherlands, away_team: france, date: DateTime.strptime('06/21/2024 21:00', '%m/%d/%Y %H:%M'))
match22 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: georgia, away_team: czechia, date: DateTime.strptime('06/22/2024 15:00', '%m/%d/%Y %H:%M'))
match23 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: turkey, away_team: portugal, date: DateTime.strptime('06/22/2024 18:00', '%m/%d/%Y %H:%M'))
match24 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: belgium, away_team: romania, date: DateTime.strptime('06/22/2024 21:00', '%m/%d/%Y %H:%M'))
match25 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: switzerland, away_team: germany, date: DateTime.strptime('06/23/2024 21:00', '%m/%d/%Y %H:%M'))
match26 = Match.create!(group: 'A', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: scotland, away_team: hungary, date: DateTime.strptime('06/23/2024 21:00', '%m/%d/%Y %H:%M'))
match27 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: albania, away_team: spain, date: DateTime.strptime('06/24/2024 21:00', '%m/%d/%Y %H:%M' ))
match28 = Match.create!(group: 'B', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: croatia, away_team: italy, date: DateTime.strptime('06/24/2024 21:00', '%m/%d/%Y %H:%M'))
match29 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: netherlands, away_team: austria, date: DateTime.strptime('06/25/2024 18:00', '%m/%d/%Y %H:%M'))
match30 = Match.create!(group: 'D', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: france, away_team: poland, date: DateTime.strptime('06/25/2024 18:00', '%m/%d/%Y %H:%M'))
match31 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: england, away_team: slovenia, date: DateTime.strptime('06/25/2024 21:00', '%m/%d/%Y %H:%M'))
match32 = Match.create!(group: 'C', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: denmark, away_team: serbia, date: DateTime.strptime('06/25/2024 21:00', '%m/%d/%Y %H:%M'))
match33 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: slovakia, away_team: romania, date: DateTime.strptime('06/26/2024 18:00', '%m/%d/%Y %H:%M'))
match34 = Match.create!(group: 'E', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: ukraine, away_team: belgium, date: DateTime.strptime('06/26/2024 18:00', '%m/%d/%Y %H:%M'))
match35 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: georgia, away_team: portugal, date: DateTime.strptime('06/26/2024 21:00', '%m/%d/%Y %H:%M'))
match36 = Match.create!(group: 'F', stage: 'phase de groupes', tournament: 'UEFA Euro 2024', home_team: czechia, away_team: turkey, date: DateTime.strptime('06/26/2024 21:00', '%m/%d/%Y %H:%M'))


pronostic1 = Pronostic.create!(match: match1, user: user1, home_team_prono: 2, away_team_prono: 1, game: blueteam1, status: 'pending')
# pronostic1 = Pronostic.create!(match: match1, user: user2, home_team_prono: 1, away_team_prono: 2, game: blueteam1, status: 'pending')
pronostic1 = Pronostic.create!(match: match1, user: user3, home_team_prono: 1, away_team_prono: 1, game: blueteam1, status: 'pending')
pronostic1 = Pronostic.create!(match: match1, user: user4, home_team_prono: 4, away_team_prono: 0, game: blueteam1, status: 'pending')
# pronostic2 = Pronostic.create!(match: match1, user: user2, home_team_prono: 0, away_team_prono: 3, game: blueteam1, status: 'pending')
pronostic3 = Pronostic.create!(match: match2, user: user1, home_team_prono: 4, away_team_prono: 1, game: blueteam1, status: 'pending')
# pronostic4 = Pronostic.create!(match: match2, user: user2, home_team_prono: 3, away_team_prono: 2, game: blueteam1, status: 'pending')
