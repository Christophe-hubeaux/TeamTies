class User < ApplicationRecord
  DEPARTMENTS = [
    'Administration, Comptabilité et Finances',
    'Ressources Humaines',
    'Marketing',
    'Logistique',
    'IT',
    'Ventes',
    'Service Client',
    'Recherche et Développement (R&D)',
    'Production',
    'Achats',
    'Service Juridique',
    'Service de la Qualité',
    'Service de la Sécurité',
    'Service des Relations Publiques',
    'Service de la Communication Interne'
  ]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :users_games
  has_many :pronostics
  has_many :games, through: :users_games
end
