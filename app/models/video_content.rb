class VideoContent < ActiveRecord::Base
  attr_accessible :lesson_id, :video_embed_code, :name, :instructions

  belongs_to :lesson

end
