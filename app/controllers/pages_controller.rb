class PagesController < ApplicationController

    def home
        if @logged_in
            redirect_to user_path(@logged_in)
        else
        render :home
        end
    end
    
end