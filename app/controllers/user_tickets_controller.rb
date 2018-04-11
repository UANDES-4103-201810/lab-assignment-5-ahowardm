class UserTicketsController < ApplicationController
  def create
    @user_ticket = UserTicket.create user_ticket_params
    # redirect_to @ticket
    render json: @user_ticket
  end

  def update
    @user_ticket = UserTicket.find params[:id]
    @user_ticket.update user_ticket_params
    render json: @user_ticket
  end

  def destroy
    @user_ticket = UserTicket.find(params[:id])
    @user_ticket.destroy
    redirect_to user_user_tickets_path
  end

  private
  def user_ticket_params
    user_ticket_params = params.require(:user_ticket).permit(:user, :ticket, :time, :paid)
  end
end
