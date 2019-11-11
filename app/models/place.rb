class Place < ApplicationRecord
    has_many :discoveries
    has_many :expeditions
    has_many :explorers, through: :expeditions
end
