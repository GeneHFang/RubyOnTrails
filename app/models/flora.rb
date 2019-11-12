class Flora < Discovery
   
    #returns value to be added to rations (can be negative)
    def getRation(expedition_instance)
        if expedition_instance.hasGuide
            #guide tells you what's edible
            return 5;
        else #eat suspicious plant
            if roll > 50
                #turns out it's edible
                return 5;
            else
                #horrible diarrhea
                return -5;
            end
        end
    end




end