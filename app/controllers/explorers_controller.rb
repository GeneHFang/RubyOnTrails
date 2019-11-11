class ExplorersController < ApplicationController
    before_action :findExplorer, only: [:show, :edit, :update]

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

    def explorerParams
        params.require().permit()
    end

    def findExplorer
        @explorer = Explorer.find(params[:id])
    end


end
