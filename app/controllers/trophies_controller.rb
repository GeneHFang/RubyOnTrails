class TrophiesController < ApplicationController
    before_action :findTrophy, only: [:show, :edit, :update]

    def create
        @trophy = Trophy.create(trophyParams)
    end
  
    def show
    end

    private 

    def trophyParams
        params.require(:trophy).permit(:name, :value)
    end

    def findTrophy
        @trophy = Trophy.find(params[:id])
    end


end
