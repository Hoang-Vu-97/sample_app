class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t("static_pages.home.welcome")
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by id: params[:id]

    return if @user
    redirect_to root_path
    flash[:danger] = t("static_pages.users.error_show")
  end

  def edit
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit :name, :email, :password,
      :password_confirmation
  end
end
