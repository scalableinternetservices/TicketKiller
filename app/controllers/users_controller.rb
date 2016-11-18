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
    # debugger
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_setting)
      flash[:success] = 'Upadte successful!'
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def user_setting
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def logged_in_as_admin
      unless logged_in? and logged_in_as_admin?
        flash[:danger] = "Please log in as admin."
        redirect_to login_url
      end
    end
end
