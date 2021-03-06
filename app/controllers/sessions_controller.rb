class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    render :login
  end

  def create
    email, password = session_params[:email], session_params[:password]
    @user = User.find_by_credentials(email, password)

    if @user
      if login_user!(@user)
        redirect_to user_url(@user)
      else
        flash[:errors] = ["Your account has not been activated."]
        redirect_to new_session_url
      end
    else
      flash.now[:errors] = ["Login failed"]
      render :login
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
