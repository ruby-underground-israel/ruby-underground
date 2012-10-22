class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :company_name
      t.string :company_url
      t.string :location
      t.text :description
      t.string :company_logo_url
      t.string :contact_email

      t.timestamps
    end
  end
end
