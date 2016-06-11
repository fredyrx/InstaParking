class District < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
   has_many :parking_lots
   
  validates_presence_of :description, :photo
end
