class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Account created!"
      redirect_to links_path
    else
      flash.now[:error] = "Invalid email or password."
      render :new
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
