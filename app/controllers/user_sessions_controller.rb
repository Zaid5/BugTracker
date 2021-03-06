class UserSessionsController < ApplicationController
	# skip_before_action :require_login, only: [:index, :create]
   skip_before_action :verify_authenticity_token
  def new
    @user = User.new
  end

  def index
  end

  def create
    user = login(params[:email], params[:password])

    if user
      redirect_back_or_to :users, success: "Logged in as #{user.username}"
    else
      flash.now[:error] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:users, success: "Logged out!")
  end
end