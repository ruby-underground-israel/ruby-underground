class Job < ActiveRecord::Base
  attr_accessible :company_logo_url, :company_name, :company_url, :contact_email, :description, :location, :name
end
