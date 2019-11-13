class ExplorersController < ApplicationController
    before_action :findExplorer, only: [:show, :edit, :update, :trophyhall]

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
        @user = User.find(@explorer.user_id)
        @id = @user.id
        if @user == @logged_in 
            render :show
        else 
            flash[:error] = "LMAO from Explorers"
            redirect_to login_path
        end
    end

    def edit 
    end

    def update
        @explorer = Explorer.update(explorerParams)
        redirect_to explorer_path(@explorer)
    end

    def trophyhall
        @trophies = @explorer.trophies
        render "trophy"
    end


    private 

    def explorerParams
        params.require(:explorer).permit(:name, :user_id)
    end

    def findExplorer
        @explorer = Explorer.find(params[:id])
    end


end
