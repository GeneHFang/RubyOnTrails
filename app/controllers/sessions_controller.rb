class SessionsController < ApplicationController
    def new 
    end

    def create 
        user = User.find_by(name: params[:login][:name])
        if user && user.authenticate(params[:login][:password])
            session[:user_id] = user.id.to_s
            flash[:notification] = "Logged In"
            redirect_to user_path(user)

        else 
            flash[:error] = "Incorrect Login"
            render :new
        end
    end

    def destroy
        session.delete(:user_id)
        flash[:notification] = "Logged Out"
        redirect_to login_path
    end
end
