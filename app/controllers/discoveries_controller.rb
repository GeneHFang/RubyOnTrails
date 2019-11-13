class DiscoveriesController < ApplicationController

    before_action :findDiscovery, only: [:show]

    def show
        if @discovery.value == nil
            @discovery.getValue
        end
    end

    private 

    def findDiscovery
        @discovery = Discovery.find(params[:id])
    end


end
