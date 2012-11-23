class VideoContent < ActiveRecord::Base
  attr_accessible :lesson_id, :video_link, :name

  belongs_to :lesson

  def videoType
  	File.extname(self.video_link).gsub(".", "")
  end

end
