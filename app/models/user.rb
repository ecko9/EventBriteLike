class User < ApplicationRecord
  has_many :events, foreign_key: 'administrator_id'

  has_many :participations, foreign_key: 'participant_id'
  has_many :events, through: :participations
end
