class PlacesController < ApplicationController

    before_action :findPlace, only: [:show, :edit, :update]

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

    def placeParams
        params.require().permit()
    end

    def findPlace
        @place = Place.find(params[:id])
    end


end
