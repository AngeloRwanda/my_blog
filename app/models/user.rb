class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  belongs_to :company

  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable



  def subdomain
  	self.company.subdomain		
  end

  
end
