class Rent < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   belongs_to :user
   belongs_to :parking_lot
   
  #validates_presence_of :description, :photo
end
