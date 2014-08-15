class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      if current_user.has_role? :admin
      else
      redirect_to :back, :alert => "Access denied."
      end
    end
  end

end
