class AddMeetupIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :meetup_id, :string
  end
end
