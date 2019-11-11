class PlacesController < ApplicationController

    before_action :findPlace, only: [:show]

    def show
    end


    private

    def findPlace
        @place = Place.find(params[:id])
    end


end
