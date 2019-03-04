class ApplicationController < ActionController::Base
	# before_action :require_login
	add_flash_types :success, :danger, :info, :error
	include Pundit
	# after_action :verify_authorized

  protect_from_forgery with: :exception


 def not_authenticated
   redirect_to login_url, error: "First login to access this page."
 end

end
