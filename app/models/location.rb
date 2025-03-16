class Location < ActiveRecord::Base
  has_many :devices
  has_and_belongs_to_many :people, join_table: :locations_people
  validates :name, presence: true
end
