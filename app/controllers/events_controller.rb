class EventsController < ApplicationController
    def index
        @user = User.find(session[:user_id])
        @events = Event.all
        # @events = Event.all
    end

    def create
        @user = User.find(session[:user_id])
        Event.create(name: params[:name], date: params[:date], city: params[:city], state: params[:state], host: @user.first_name, user_id: @user.id)
        redirect_to "/events"
    end

    def show
        @event = Event.find(params[:id])
        @user = User.find(session[:user_id])
        @comments = Comment.where("event_id = #{@event.id}")
        render "show"
    end

    def delete
        @joins = Join.where("event_id = #{params[:id]}")
        @joins.destroy_all
        Event.destroy(params[:id])
        redirect_to '/events'
    end

    def join
        Join.create(user_id: params[:user_id], event_id: params[:event_id])
        redirect_to '/events'
    end

    def unjoin
        @join = Join.where("event_id = #{params[:event_id]} and user_id = #{params[:user_id]}")
        @join.destroy_all
        redirect_to '/events'
    end
end
