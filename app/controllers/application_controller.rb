class ApplicationController < ActionController::Base
	# before_action :require_login
	add_flash_types :success, :danger, :info
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protect_from_forgery with: :exception

  # def current_user
  #   super || OpenStruct.new(full_name: 'Guest')
  # end

	# private

	# def user_not_authorized
 #    flash[:alert] = "You are not authorized to access this page."
 #    redirect_to(request.referrer || root_path)
 #  end

 def not_authenticated
   redirect_to login_url, :alert => "First login to access this page."
 end

end
