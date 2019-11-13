class Place < ApplicationRecord
    has_many :discoveries
    has_many :expeditions
    has_many :explorers, through: :expeditions

    def discoveryChance(progress)
    
        if progress == 25
            return getDiscovery(progress)
        end

        modifier = -5 + progress * 5
        r = roll + modifier
        r = 0 if r < 0

        if r > 50 
            return getDiscovery(progress)
        else
            return nil
        end


    end

    def getDiscovery(progress)
        modifier = -50 + progress * 10
        r = roll + modifier
        r = 0 if r < 0

        if r < 34
            return getAnimal
        elsif r < 67
           return  getFlora
        else 
           return  getArtifact
        end

    end

    def getAnimal
        self.discoveries.select {|d| d.type.to_s == "Animal" }.sample
    end

    def getFlora
        self.discoveries.select {|d| d.type.to_s == "Flora" }.sample
    end

    def getArtifact
        self.discoveries.select {|d| d.type.to_s == "Artifact" }.sample
    end





    def roll
        rand(1..100)
    end

end
