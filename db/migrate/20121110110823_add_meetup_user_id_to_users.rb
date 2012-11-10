class AddMeetupUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :meetup_user_id, :string
  end
end
