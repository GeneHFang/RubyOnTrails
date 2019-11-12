class User < ApplicationRecord
    has_many :explorers
    has_secure_password 
    validates :name, presence: true, uniqueness: true
end
