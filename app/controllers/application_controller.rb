class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	def after_sign_in_path_for(resource)
      
      if current_user.has_role? :admin
      sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    	
    	if request.referer == sign_in_url
      		super
    	else
      		stored_location_for(resource)
    	end

      else
      sign_in_url = url_for(:action => 'new', :controller => 'sessions', :only_path => false, :protocol => 'http')
    	
    	if request.referer == sign_in_url
      		super
    	else
      		stored_location_for(resource)
    	end
      end

	end

end
