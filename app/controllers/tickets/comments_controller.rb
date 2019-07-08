module Tickets
  class CommentsController < ApplicationController
    def create
      @comment = CommentForm.new(comment_params)
      if @comment.save
        redirect_to ticket_path(ticket), notice: 'Comment Created !!'
      else
        redirect_to ticket_path(ticket), error: 'Invalid Comment'
      end
    end

    private

    def comment_params
      params.require(:comment)
        .permit(:body)
        .merge(ticket_id: ticket.id, user_id: current_user.id)
    end

    def ticket
      Ticket.find(params[:ticket_id])
    end
  end
end
