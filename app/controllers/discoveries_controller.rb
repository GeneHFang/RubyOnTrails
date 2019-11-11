class DiscoveriesController < ApplicationController

    before_action :findDiscovery, only: [:show]

    def show
    end

    private 

    def findDiscovery
        @discovery = Discovery.find(params[:id])
    end


end
