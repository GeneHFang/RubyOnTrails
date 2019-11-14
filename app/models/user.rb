class User < ApplicationRecord
    has_many :explorers
    has_secure_password 
    validates :name, presence: true, uniqueness: true

    def averageExplorerWealth
        numExplorers = self.explorers.count
        count = 0
        self.explorers.each { |explorer| count+= explorer.money }

        count / numExplorers
    end

end
