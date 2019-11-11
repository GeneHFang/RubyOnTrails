class ExpeditionsController < ApplicationController
    before_action :findExpedition, only: [:show, :edit, :update]

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

    def expeditionParams
        params.require().permit()
    end

    def findExpedition
        @expedition = Expedition.find(params[:id])
    end


end
