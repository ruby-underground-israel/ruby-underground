class Job < ActiveRecord::Base
  attr_accessible :company_logo_url, :company_name, :company_url, :contact_email, :description, :location, :name, as: [:admin, :default]
  attr_accessible :published, as: :admin

  scope :published, where(published: true)
end
