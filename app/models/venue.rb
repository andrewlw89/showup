class Venue < ApplicationRecord
	validates_presence_of :name
	validates_presence_of :address
	validates_presence_of :city
	validates_presence_of :state, length: { maximum: 5 }
	has_attached_file :photo
	validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	belongs_to :owner
	has_many :events
	accepts_nested_attributes_for :events
end
