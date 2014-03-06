class Event < ActiveRecord::Base
  belongs_to :creator, class_name: "User", foreign_key: "user_id"

  has_many :event_attendances
  has_many :users, :through => :event_attendances  

end
