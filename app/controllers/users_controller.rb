class UsersController < ApplicationController
  before_action :find_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end

  def update
    if @user.update!(user_params)
      redirect_to users_path, alert: 'User updated.'
    else
      redirect_to users_path, alert: 'Unable to update user.'
    end
  end
    
  def destroy
    unless @user == current_user
      @user.destroy
      redirect_to users_path, notice: 'User deleted.'
    else
      redirect_to users_path, alert: 'Can\'t delete yourself.'
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit()
  end
end