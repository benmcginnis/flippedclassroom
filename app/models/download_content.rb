class DownloadContent < ActiveRecord::Base
  attr_accessible :download_link, :instructions, :lesson_id, :name

  belongs_to :lesson
end
