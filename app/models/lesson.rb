class Lesson < ActiveRecord::Base
  attr_accessible :name

  has_many :website_contents, dependent: :destroy
  has_many :video_contents, dependent: :destroy
  has_many :download_contents, dependent: :destroy

  def next_lesson
  	self.class.first(:conditions => ["id > ?", id], :order => "id asc")
  end

  def previous_lesson
  	self.class.first(:conditions => ["id < ?", id], :order => "id desc")
  end

  def next_content(currentContentID, type)
    case type
    when "vc"
      puts "in vc case with #{currentContentID}"
     nextVC = self.video_contents.first(:conditions => ["id > ?", currentContentID], :order => "id asc")
     firstWC = self.website_contents.first(:order => "id asc")
     firstDC = self.download_contents.first(:order => "id asc")

     if nextVC.nil? && firstWC.nil?
      return firstDC
     elsif nextVC.nil?
      return firstWC
     else
      return nextVC
     end

    when "wc"
  	 nextWC = self.website_contents.first(:conditions => ["id > ?", currentContentID], :order => "id asc")
     firstDC = self.download_contents.first(:order => "id asc")
     
     if nextWC.nil? 
      return firstDC
     else
      return nextWC
     end
    
    when "dc"
     self.download_contents.first(:conditions => ["id > ?", currentContentID], :order => "id asc")
   end
  end

  def previous_content(currentContentID, type)
    case type
    when "vc"
      nextVC = self.video_contents.first(:conditions => ["id < ?", currentContentID], :order => "id desc")
    when "wc"
      nextWC = self.website_contents.first(:conditions => ["id < ?", currentContentID], :order => "id desc")
      firstVC = self.video_contents.first(:order => "id desc")

      if nextWC.nil?
        return firstVC
      else
        return nextWC
      end

    when "dc"
      nextDC = self.download_contents.first(:conditions => ["id < ?", currentContentID], :order => "id desc")
      firstWC = self.website_contents.first(:order => "id desc")
      firstVC = self.video_contents.first(:order => "id desc")

      if nextDC.nil? && firstWC.nil?
        return firstVC
      elsif nextDC.nil?
        return firstWC
      else
        return nextDC
      end

    end

  end
end
