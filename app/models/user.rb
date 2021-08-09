class User < ApplicationRecord

  has_many :events, foreign_key: 'administrator_id'

  has_many :participations, foreign_key: 'participant_id'
  has_many :events, through: :participations

  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Donnez un mail valide" }
  validates :first_name, presence: true, length: { in: 1..25 }
  validates :last_name, presence: true, length: { in: 1..25 }
  validates :description, length: { in: 5..300 }


  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
