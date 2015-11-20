class UsersController < ApplicationController
  before_action :require_login, only: :show
  before_action :redirect_if_logged_in, only: [:new, :create]

  def new
    @user = User.new
    render :signup
  end

  def create
    @user = User.new(user_params)
    if @user.save
      msg = UserMailer.activation_email(@user)
      msg.deliver

      if login_user!(@user)
        redirect_to bands_url
      else
        flash[:errors] = ["Your account has not been activated."]
        redirect_to new_session_url
      end
    else
      flash.now[:errors] = @user.errors.full_messages
      render :signup
    end
  end

  def show
    @user = current_user
    render :show
  end

  def activate
    query_token = params[:activation_token]
    @user = User.find_by(activation_token: query_token)
    @user.toggle!(:activated)
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
