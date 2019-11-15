class ExplorersController < ApplicationController
    before_action :findExplorer, only: [:show, :edit, :update, :trophyhall]

    def index
        @explorers = Explorer.all
    end
    
    def new
        # byebug
            @explorer = Explorer.new
            @user_id = session[:user_id]
        
      
    end

    def create
    #    byebug
    @explorer = Explorer.new(explorerParams)
    @explorer.assign_attributes(user_id:params[:user_id])
  
        if @explorer.save
            @explorer.update(user_id:params[:user_id])
            redirect_to explorer_path(@explorer)
        else 
            flash[:error] = @explorer.errors.full_messages
            redirect_to new_explorer_path
        end

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
