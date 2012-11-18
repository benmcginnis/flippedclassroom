class WebsiteContent < ActiveRecord::Base
  attr_accessible :lesson_id, :contentlink, :name

  #before_save do |wc|

  #	unless wc.contentlink.validate(URI::regexp(%w(http https)))
  #		wc.contentlink = "http://" + wc.contentlink
  #	end
  	
  #end

  validates :contentlink,  presence: true, format: { with: URI::regexp(%w(http https)), message: "Must be a valid url, including http://"}
  validates :name,  presence: true
end
