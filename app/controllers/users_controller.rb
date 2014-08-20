class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def show
  end

  def new
    @user = User.new
    @title = "Create an account"
  end

  def create
    @user = User.create(user_params)
    redirect_to @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :display_name, :role, :password, :password_confirmation)
  end

end
