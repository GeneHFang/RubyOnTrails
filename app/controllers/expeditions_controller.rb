class ExpeditionsController < ApplicationController
    before_action :findExpedition, only: [:show, :edit, :update]

    def new
        @expedition = Expedition.new
        @places = Place.all
        @explorer_id = params[:explorerID]
        @explorer = Explorer.find(@explorer_id)
    end

    def create
        
        @expedition = Expedition.new(expeditionParams)
        @expedition.assign_attributes(explorer_id: params[:explorerID])
       

        if @expedition.save
        @explorer = Explorer.find(params[:explorerID])

            if @expedition.hasGuide 
                @explorer.money -= 10
            end

            if @expedition.hasWeapon
                @explorer.money -= 5000
            end

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
        @explorer = @expedition.explorer 

        if @expedition.progress == 7 || @expedition.progress == 26
            @img = "#{placename}/img7.jpg"
            @over = true
            render :show
            return
        end

        # check progress and display appropriate image
        @img = "#{placename}/img#{@expedition.progress}.jpg"

        if params[:explore] 
            @explorer.rations -= 10
            # byebug
           discovery = @expedition.place.discoveryChance(@expedition.progress) #returns discovery instance
            if discovery 
                # byebug
                @dname = discovery.name
                @guide = []
                @trophy = []
                ration_change = discovery.resolve(@expedition, @trophy, @guide)
                # byebug
                
                @explorer.rations += ration_change
            end
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
            @explorer.rations -= 15
            @explorer.save
            @expedition.progress += 1
            @expedition.save
            @img = "#{placename}/img#{@expedition.progress}.jpg"
            params[:move_on] = false
            render :show
            return
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
