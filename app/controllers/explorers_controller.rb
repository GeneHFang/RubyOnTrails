class ExplorersController < ApplicationController
    before_action :findExplorer, only: [:show, :edit, :update]

    def index
        @explorers = Explorer.all
    end
    
    def new

        @explorer = Explorer.new
        @user_id = params[:TESTID]
      
    end

    def create
        # byebug
        @explorer = Explorer.create(explorerParams)
        @explorer.update(user_id:params[:user_id])
        redirect_to explorer_path(@explorer)
    end

    def show
    end

    def edit 
    end

    def update
        @explorer = Explorer.update(explorerParams)
        redirect_to explorer_path(@explorer)
    end


    private 

    def explorerParams
        params.require(:explorer).permit(:name, :user_id)
    end

    def findExplorer
        @explorer = Explorer.find(params[:id])
    end


end
