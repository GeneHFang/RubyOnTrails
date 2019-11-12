class Animal < Discovery
   
    # def initialize(hash)
    #     super(hash)
    # end


    #returns ration amount change 
    def resolveEncounter(expedition_instance)

        if expedition_instance.hasWeapon
            #animal head is harvested as trophy
            #check truthiness of @trophyMessage to display
            if roll > 66
               @trophyMessage = takenAsTrophy(expedition_instance.explorer_id)
            end
            #animal is slaughtered for meat
            return 15
        else
            rationValue = -10
            #see if guide gets killed
            if roll > 50
                expedition_instance.hasGuide = false
                @guideKill = "Yoan has sacrificed his life to save you."
                rationValue -= 10
            end
            return rationValue
        end



    end



end