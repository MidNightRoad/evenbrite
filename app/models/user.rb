class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many :attendances
has_many :evenement, through: :attendances
has_many :evenements, foreign_key: 'evenement_id', class_name: 'Evenement'
after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
