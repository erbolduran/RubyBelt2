class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:email])
        if user
            if user.authenticate(params[:password])
                session[:user_id] = user.id

                return redirect_to products_path
            end

            flash[:error] = ["Password Incorrect Homes."]
        else
            flash[:error] = ["Email Incorrect Homes."]
        end

        return redirect_to :back
    end

    def destroy
    end
end
