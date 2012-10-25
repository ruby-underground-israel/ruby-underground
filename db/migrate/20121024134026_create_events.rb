class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :url
      t.datetime :time
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
