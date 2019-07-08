module Tickets
  class StatusesController < ApplicationController
    def update
      @ticket = Ticket.find(params[:ticket_id])
      authorize @ticket, policy_class: Tickets::StatusPolicy

      if @ticket.update status: status
        redirect_to ticket_path(@ticket), notice: "Ticket Updated !!"
      end
    end

    private

    def status
      params[:status]
    end
  end
end
