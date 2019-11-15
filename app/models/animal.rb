class Animal < Discovery
   
    # def initialize(hash)
    #     super(hash)
    # end


    #returns ration amount change 
    def resolveEncounter(expedition_instance, trophyMessage, guideMessage)

        if expedition_instance.hasWeapon
            #animal head is harvested as trophy
            #check truthiness of @trophyMessage to display
            trophyMessage << "⚔️💀💀💀💀You murder the beast in cold blood with your weapon🔪💀💀💀💀"
            if roll > 66
               trophyMessage << "You made a clean kill, and manage to harvest an intact #{self.name}'s head#{emoji(self.name)}"
               trophyMessage << takenAsTrophy(expedition_instance.explorer_id)
                
            end
            #animal is slaughtered for meat
               trophyMessage << "🍗You butcher the corpse for some 🍗🍗🍗"
            return 15
        else
            trophyMessage << "You run into a #{self.name}#{emoji(self.name)}, but do not have a weapon to defend yourself!" 
            trophyMessage << "You throw some food at it in hopes to escape and lose 10 🍗🍗🍗.😞"

            rationValue = -10
            #see if guide gets killed
            if roll > 50 && expedition_instance.hasGuide
                expedition_instance.hasGuide = false
                expedition_instance.save
                guideMessage << "Yoan has sacrificed his life💀💀 to save you! He perishes along with the 10 🍗🍗🍗 he was holding onto.😞😞"
                rationValue -= 10
            end
            return rationValue
        end



    end


   




end