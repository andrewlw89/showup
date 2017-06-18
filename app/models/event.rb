class Event < ApplicationRecord
  acts_as_votable
  belongs_to :venue

  has_many :likes
  has_many :users, through: :likes
end
