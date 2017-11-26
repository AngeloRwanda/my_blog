class SubdomainConstraint
	def self.matches?(request)
		subdomains = %w{www companies}
		request.subdomain.present? && !subdomains.include?(request.subdomain)
	end
end

Rails.application.routes.draw do
	devise_scope :user do
		unauthenticated do
			root 'devise/sessions#new', as: :unauthenticated_root
		end
		authenticated do
			root 'projects#index', as: :authenticated_root
		end
	end


	devise_for :users

	resources :companies

	constraints SubdomainConstraint do
		resources :articles
		resources :posts
		resources :projects
		# end
		root to: "projects#index", :as => :root
	end
end
