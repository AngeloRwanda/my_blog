class Company < ApplicationRecord
has_many :users

after_create :create_tenant

	private
	def create_tenant
		Apartment::Tenant.create(subdomain)
	end
end
