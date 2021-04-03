class UsersController < ApplicationController

  before_action :set_user, only: %i[show]
  before_action :authenticate_user!

  def index
    authorize User
    render json: User.all
  end

  def show
    authorize @users
    render json: @users
  end

  private

  def set_user
    @users = User.find(params[:id])
  end
end
