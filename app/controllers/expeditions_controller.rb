class ExpeditionsController < ApplicationController
    before_action :findExpedition, only: [:show, :edit, :update]

    def new
        @expedition = Expedition.new
        @places = Place.all
        @explorer_id = params[:explorerID]
    end

    def create
        
        @expedition = Expedition.new(expeditionParams)
        @expedition.assign_attributes(explorer_id: params[:explorerID])

        if @expedition.save
            redirect_to @expedition
        else
            flash[:error] = @expedition.errors.full_messages
            redirect_to new_expedition_path
        end

    end

    def index
    end

    def show
        @place = @expedition.place
    end

    def edit 
    end

    def update
    end


    private 

    def expeditionParams
        params.require(:expedition).permit(:place_id, :hasWeapon, :hasGuide)
    end

    def findExpedition
        @expedition = Expedition.find(params[:id])
    end


end
