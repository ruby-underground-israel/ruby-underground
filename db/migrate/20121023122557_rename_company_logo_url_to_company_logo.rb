class RenameCompanyLogoUrlToCompanyLogo < ActiveRecord::Migration
  def up
    rename_column :jobs, :company_logo_url, :company_logo
  end

  def down
    rename_column :jobs, :company_logo, :company_logo_url
  end
end
