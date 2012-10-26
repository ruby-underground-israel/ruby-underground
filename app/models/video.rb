class Video < ActiveRecord::Base
  attr_accessible :description, :thumbnail, :title, :youtube_id

  default_scope order('created_at desc')
end
