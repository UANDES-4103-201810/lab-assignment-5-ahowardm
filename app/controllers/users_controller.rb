class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def show
    @user = User.find params[:id]
    render json: @user
  end

  def create
    @user = User.create user_params
    # redirect_to @ticket
    render json: @user
  end

  def update
    @user = User.find params[:id]
    @user.update user_params
    render json: @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  def top_ten_clients
    @users_tickets = UserTicket.group(:user).count.sort_by {|key, value| value }.reverse!.first(10)
    render json: @users_tickets
  end

  private
  def user_params
    user_params = params.require(:user).permit(:name, :last_name, :email, :phone, :password, :address)
  end
end
