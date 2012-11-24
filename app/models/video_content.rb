class VideoContent < ActiveRecord::Base
  attr_accessible :lesson_id, :video_embed_code, :name

  belongs_to :lesson

end
