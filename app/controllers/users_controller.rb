class UsersController < ApplicationController
    before_action :findUser, only: [:show, :edit, :update]

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

    def userParams
        params.require().permit()
    end

    def findUser
        @user = User.find(params[:id])
    end


end
