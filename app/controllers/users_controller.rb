class UsersController < ApplicationController
    def index
        render "index"
    end

    def create
        if params[:password] == params[:confirm]
            @user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city],
            state: params[:state], password: params[:password])
            session[:user_id] = @user.id
            return redirect_to "/events"
        else
            flash[:error] = "Passwords must match!"
            return redirect_to "/"
        end
    end

    def edit
        @user = User.find(session[:user_id])
        render "edit"
    end

    def update
        @user = User.update(params[:id], first_name: params[:first_name], last_name: params[:last_name], email: params[:email], city: params[:city],
        state: params[:state])
        redirect_to '/events'
    end

    def login
        @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
        if @user == false
            flash[:error] = "Invalid email or password"
            return redirect_to '/'
        else
            session[:user_id] = @user.id
            return redirect_to '/events'
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to '/'
    end
end
