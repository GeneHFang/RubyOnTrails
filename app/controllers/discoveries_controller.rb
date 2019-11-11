class DiscoveriesController < ApplicationController

    before_action :findDiscovery, only: [:show, :edit, :update]

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

    def discoveryParams
        params.require().permit()
    end

    def findDiscovery
        @discovery = Discovery.find(params[:id])
    end


end
