class Lesson < ActiveRecord::Base
  attr_accessible :name

  has_many :website_contents, dependent: :destroy

  def next_lesson
  	self.class.first(:conditions => ["id > ?", id], :order => "id asc")
  end

  def previous_lesson
  	self.class.first(:conditions => ["id < ?", id], :order => "id desc")
  end

  def next_content(currentContentID)
  	self.website_contents.first(:conditions => ["id > ?", currentContentID], :order => "id asc")

  end

  def previous_content(currentContentID)
  	self.website_contents.first(:conditions => ["id < ?", currentContentID], :order => "id desc")

  end
end
