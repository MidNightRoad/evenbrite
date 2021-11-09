class Evenement < ApplicationRecord
has_many :attendances
has_many :users, through: :attendances
validates :start_date, presence: true 
validate :start_date_cannot_be_in_the_past
validates :duration, presence: true
validate :duration_modulo_5 
#validates :title, presence: true, length: { in: 5..140 }
#validates :description, presence: true, length: { in: 20..1000}
#validates :price, presence: true,  length: { in: 1..1000}
#validates :location, presence: true 
belongs_to :admin, class_name: "User"


def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
end

  def duration_modulo_5
    if !(duration % 5==0) || duration.negative?
      errors.add(:duration, "prout")
    end
  end



end

