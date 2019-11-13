class SessionsController < ApplicationController
    def new 
        if session[:user_id]
            redirect_to user_path(User.find(session[:user_id]))
        end
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
