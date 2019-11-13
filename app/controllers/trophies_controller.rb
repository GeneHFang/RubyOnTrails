class TrophiesController < ApplicationController
    before_action :findTrophy, only: [:show, :edit, :update]

    def create
        @trophy = Trophy.create(trophyParams)
    end
  
    def show
        @user = @trophy.explorer.user
        @id = @user.id
        if @user == @logged_in 
            render :show
        else 
            flash[:error] = "LMAO from Trophies"
            redirect_to login_path
        end
    end

    private 

    def trophyParams
        params.require(:trophy).permit(:name, :value)
    end

    def findTrophy
        @trophy = Trophy.find(params[:id])
    end


end
