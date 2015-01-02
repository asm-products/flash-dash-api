class ApplicationController < ActionController::Base
	respond_to :json
	# Prevent CSRF attacks by raising an exception.
	protect_from_forgery with: :null_session,:if => Proc.new { |c| c.request.format == 'application/json' }
	acts_as_token_authentication_handler_for User

	# Apply strong_parameters filtering before CanCan authorization
	# See https://github.com/ryanb/cancan/issues/571#issuecomment-10753675
#	before_filter do
#		resource = controller_name.singularize.to_sym
#		method = "#{resource}_params"
#		params[resource] &&= send(method) if respond_to?(method, true)
#	end

#	rescue_from CanCan::AccessDenied do |exception|  
#		respond_to do |format|  
#			format.json { render :json=> exception.to_json, :status => :forbidden }  
#		end   
#	end
end
