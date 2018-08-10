class CommentsController < ApplicationController
    def create
        Comment.create(comment: params[:comment], user_id: params[:user_id], event_id: params[:event_id])
        redirect_to "/events/#{params[:event_id]}"
    end
end
