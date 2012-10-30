class RenameUrlToEventUrl < ActiveRecord::Migration
  def up
    rename_column :events, :url, :event_url
  end

  def down
    rename_column :events, :event_url, :url
  end
end
