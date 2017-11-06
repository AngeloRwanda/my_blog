class SubdomainConstraint
	def self.matches?(request)
		subdomains = %w{ www}
		request.subdomain.present? && !subdomains.include?(request.subdomain)
	end
end

Rails.application.routes.draw do
	devise_for :users
	
	constraints SubdomainConstraint do
		resources :posts
		resources :projects
	end
	
	root to: "projects#index"
end
