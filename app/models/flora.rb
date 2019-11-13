class Flora < Discovery
   
    #returns value to be added to rations (can be negative)
    def getRation(expedition_instance, messages)
        if expedition_instance.hasGuide
            #guide tells you what's edible
            messages << "Your guide Yoan tells you what parts are edible and you gain 5 rations!"
            return 5;
        else #eat suspicious plant
            if roll > 50
                #turns out it's edible
                messages << "You gamble and eat the suspicious plant and thankfully you didn't die! You gain 5 rations!"
                return 5;
            else
                #horrible diarrhea
                messages << "You gamble and eat the suspicious plant and unfortunately you got horrible diarrhea! You take time to recover and meanwhile consume 5 rations."
                return -5;
            end
        end
    end




end