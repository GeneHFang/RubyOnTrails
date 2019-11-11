class Explorer < ApplicationRecord
    belongs_to :user
    has_many :trophies
    has_many :expeditions
    has_many :places, through: :expeditions
end
