class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all
    render json: @tickets
  end

  def show
    @ticket = Ticket.find params[:id]
    render json: @ticket
  end

  def create
    @ticket = Ticket.create ticket_params
    # redirect_to @ticket
    render json: @ticket
  end

  def update
    @ticket = Ticket.find params[:id]
    @ticket.update ticket_params
    render json: @ticket
  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to tickets_path
  end

  def most_expensive_tickets
    @tickets = Ticket.where(event_id: params[:id]).order('price desc').limit(10)
  end

  private
    def ticket_params
      ticket_params = params.require(:ticket).permit(:description, :price, :event)
    end
end
