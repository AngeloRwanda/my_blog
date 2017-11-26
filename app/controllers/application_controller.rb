class ApplicationController < ActionController::Base
	# protect_from_forgery with: :exception

	protect_from_forgery prepend: true
	before_action :authenticate_user!
	before_action :set_subdomain!


 
	# private
	def after_sign_in_path_for(resource)
		articles_url(:subdomain => current_user.subdomain)
	end

	def after_sign_out_path_for(resource)
		root_url(:subdomain =>"www")
	end

	def set_subdomain!
		if current_user && request.subdomain != current_user.subdomain
			redirect_to root_url(:subdomain => current_user.subdomain)
			# puts "The Subdomain is: nil" if !request.subdomain.present? #This prints to the console
		end
	end
end
