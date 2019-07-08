class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = TicketForm.new
  end

  def create
    @ticket = TicketForm.new(ticket_params)

    if @ticket.save
      redirect_to root_path, notice: 'Ticket Created !!'
    else
      render :new
    end
  end

  def show
    @ticket   = Ticket.find(params[:id])
    @comment  = CommentForm.new
    @comments = @ticket.comments.reverse
  end

  private

  def ticket_params
    params.require(:ticket).permit(:title, :body).merge(user_id: current_user.id)
  end
end
