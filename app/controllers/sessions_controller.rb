class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    name, password = session_params.values
    @user = User.find_by_credentials(name, password)
    if @user.valid?
      login(@user)
      redirect_to new_user_url(@user)
    else
      flash[:messages] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:session).permit(:user_name, :password)
  end
end
