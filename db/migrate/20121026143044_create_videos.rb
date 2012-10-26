class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.string :thumbnail
      t.string :youtube_id

      t.timestamps
    end
  end
end
