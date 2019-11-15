class HiscoresController < ApplicationController

    def index

         #Ensures spaces in search field are not searched.
        string = params[:user_name]
        string.strip! if string.is_a?(String)
        if string == ""
        params[:user_name] = nil
        end

        if params[:user_name]
            @explorers = Explorer.search(params[:user_name])
            @user = User.find_by(name: params[:user_name])
            # @heroines = Heroine.search(params[:user_name])
        else
            @explorers = Explorer.wealthiest
        end

    end


end
