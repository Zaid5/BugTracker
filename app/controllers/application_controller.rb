class ApplicationController < ActionController::Base
	# before_action :require_login
	rescue_from ActionController::RoutingError do |exception|
	 logger.error 'Routing error occurred'
	 render plain: '404 Not found', status: 404 
	end
	
	add_flash_types :success, :danger, :info, :warning, :error
	include Pundit
	# after_action :verify_authorized

  protect_from_forgery with: :exception


 def not_authenticated
   redirect_to login_url, warning: "First login to access this page."
 end

end
