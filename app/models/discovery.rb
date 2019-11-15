class Discovery < ApplicationRecord
    belongs_to :place

    # def initialize
    #     @value = getValue
    # end

    
    def takenAsTrophy(explorer_id)
        getValue
        Trophy.create(name: trophyName, value: self.value, explorer_id: explorer_id)
        @explorer = Explorer.find(explorer_id)
        @explorer.money += self.value
        @explorer.save
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

        self.save

    end

    def resolve(expedition, trophyMessage, guideMessage)

        if self.class.to_s == "Animal"
            return resolveEncounter(expedition, trophyMessage, guideMessage)
        elsif self.class.to_s == "Flora" 
            return getRation(expedition, guideMessage)
        elsif self.class.to_s == "Artifact"
            trophyMessage << takenAsTrophy(expedition.explorer.id)
            return 0
        end
    end


    def emoji(name)

        if name == "Enraged Monkey"
            return " 🙊"
        elsif name == "Hungry Tiger"
            return " 🐯"
        elsif name == "Poisonous Snake"
            return " 🐍"
        elsif name == "Giant Scorpion"
            return " 🦂"
        elsif name == "Copper Idol"
            return " 🗽"
        elsif name == "Ornate Vase"
            return " 🏺"
        elsif name == "Strange Roots"
            return " 🥜"
        elsif name == "Vibrant Berries"
            return " 🍒"
        elsif name == "Preserved Painting"
            return " 🖼"
        elsif name == "Rusty Sword"
            return " 🗡"
        elsif name == "Leafy Vine"
            return " 🌿"
        elsif name == "Juicy Moss"
            return " 🥦"
        end


    end

    def roll 
        rand(1..100)
    end

end
