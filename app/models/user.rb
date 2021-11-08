class User < ApplicationRecord
has_many :attendances
has_many :evenement, through: :attendances
has_many :evenements, foreign_key: 'evenement_id', class_name: 'Evenement'
end
