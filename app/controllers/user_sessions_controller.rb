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
      redirect_back_or_to :users, notice: 'Login successful'
    else
      flash.now[:alert] = 'Login failed'
      render :new
    end
  end

  def destroy
    logout
    redirect_to(:users, notice: 'Logged out!')
  end
end