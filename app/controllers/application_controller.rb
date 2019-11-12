class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :logged_in_check 

    def logged_in_check

        if session[:user_id]

        
        user = User.find(session[:user_id])
            if user 
                @logged_in = user
            end
        end
    end
end
