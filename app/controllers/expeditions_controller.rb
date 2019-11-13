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
        placename = @place.name

        #check progress and display appropriate image
        # @img = "assets/images/#{placename}/img#{@place.progress}.jpg""

        if params[:explore]
            #check if early or later area (how do we check for this
                        # new column called progress in Place? increment each time explorer :move_on ) 
            #assign modifier based on ^
            #roll for chance of a discovery (w modifier)
            #if discovery, then roll for what kind of outcome (w modifier)
            #decrement explorer rations
        elsif params[:move_on]
            #increment progress 
            #check if guide
            #decrement (^more if) rations 

        end

       

            
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
