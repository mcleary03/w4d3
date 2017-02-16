class UsersController < ApplicationController

  def show
    render :show
  end

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save!
      login(@user)
      redirect_to new_user_url
    else
      flash[:messages] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
