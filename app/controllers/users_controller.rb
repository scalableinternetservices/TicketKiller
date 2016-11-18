class UsersController < ApplicationController
  before_action :logged_in_as_admin, only: [:index]

  def index
    @users = User.all
  end

  def new
    @user = User.new
    # debugger
  end

  def show
    @user = User.find(params[:id])
    @officers = Officer.all

    @user.car.each do |car| 
      Officer.all.each do |officer| 
        if CarsHelper.distance(car, officer) < 0.3
          flash[:danger] = 'Your Cars Are In DANGER'
        end
      end 
    end
    # debugger
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_setting)
      flash[:success] = 'Update successful!'
      redirect_to @user
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to TicketKiller!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def user_setting
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar)
    end

    def logged_in_as_admin
      unless logged_in? and logged_in_as_admin?
        flash[:danger] = "Please log in as admin."
        redirect_to login_url
      end
    end
end
