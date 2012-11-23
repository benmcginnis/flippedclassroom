class Lesson < ActiveRecord::Base
  attr_accessible :name


  def next_lesson
  	self.class.first(:conditions => ["id > ?", id], :order => "id asc")
  end

  def previous_lesson
  	self.class.first(:conditions => ["id < ?", id], :order => "id desc")

  end

end
