class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
      #redirect_to user_url(@user), sama dgn di atas
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Successfully update profile"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end


  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
