class Discovery < ApplicationRecord
    belongs_to :place

    # def initialize
    #     @value = getValue
    # end

    
    def takenAsTrophy(explorer_id)
        Trophy.create(name: trophyName, value: self.value, explorer_id: explorer_id)
        "#{trophyName} taken as trophy"
    end

    def trophyName
        if self.class.to_s == "Animal"
            return "#{self.name} Head"
        else
            return self.name
        end
    end
    

    def getValue

        if self.class.to_s == "Flora"
            self.value = 0
        elsif self.class.to_s == "Discovery"
            self.value = 0
        elsif self.class.to_s == "Animal"
            self.value = 3200
        else 
            self.value = 100000
        end

    end



    def roll 

        rand(1..100)

    end


end
