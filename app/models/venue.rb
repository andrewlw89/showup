class Venue < ApplicationRecord
	validates_presence_of :name
	validates_presence_of :address
	validates_presence_of :city
	validates_presence_of :state
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
