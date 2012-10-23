class Job < ActiveRecord::Base
  attr_accessible :company_logo, :company_name, :company_url, :contact_email, :description, :location, :name, as: [:admin, :default]
  attr_accessible :published, as: :admin

  validates :name, presence: true
  validates :company_name, presence: true
  validates :company_url, presence: true
  validates :location, presence: true
  validates :contact_email, presence: true, format: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/

  scope :published, where(published: true)

  mount_uploader :company_logo, CompanyLogoUploader

  def to_param
    "#{id}-#{company_name.parameterize}"
  end
end
