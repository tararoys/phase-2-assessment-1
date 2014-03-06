class User < ActiveRecord::Base
  has_many :created_events, class_name: "Event"

  has_many :event_attendances
  has_many :events, :through => :event_attendances  

  has_secure_password
end
