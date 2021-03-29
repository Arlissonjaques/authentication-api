class UsersController < ApplicationController

  before_action :set_user, only: %i[show]

  def index
    render json: User.all
  end

  def show
    render json: @users
  end

  private

  def set_user
    @users = User.find(params[:id])
  end
end
