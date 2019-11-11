class TrophiesController < ApplicationController
    before_action :findTrophy, only: [:show, :edit, :update]

    def new
    end

    def create
    end

    def index
    end

    def show
    end

    def edit 
    end

    def update
    end


    private 

    def trophyParams
        params.require().permit()
    end

    def findTrophy
        @trophy = Trophy.find(params[:id])
    end


end
