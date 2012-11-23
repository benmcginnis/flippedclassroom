class WebsiteContent < ActiveRecord::Base
  attr_accessible :lesson_id, :contentlink, :name

  belongs_to :lesson

  validates :contentlink,  presence: true, format: { with: URI::regexp(%w(http https)), message: "Must be a valid url, including http://"}
  validates :name,  presence: true
end
