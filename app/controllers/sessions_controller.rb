class SessionsController < ApplicationController
  def new
    render :login
  end

  def create
    email, password = session_params[:email], session_params[:password]
    @user = User.find_by_credentials(email, password)
    if @user
      login_user!(@user)
      redirect_to bands_url
    else
      flash.now[:errors] = ["Login failed"]
      render :login
    end
  end

  def destroy
    current_user.reset_session_token!
    redirect_to bands_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
