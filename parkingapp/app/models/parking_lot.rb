class ParkingLot < ActiveRecord::Base
  belongs_to :user
  belongs_to :district
  
  def some_query
  end
  
  #params[:district_id],params[:date],params[:start_time],params[:end_time],params[:cameras],params[:persons],params[:alarms]
  def self.search(district_id,date,start_time, end_time, has_cameras, has_persons, has_alarms )
    if district_id
      ParkingLot.where(
          ["district_id = ? and has_security_cameras = ? and has_security_persons = ? and has_security_alarms = ?" , 
      district_id, has_cameras, has_persons, has_alarms
      ]
      )
    else
      ParkingLot.all
    end
  end  
  
  def self.basic_search(district_id)
    if district_id
      ParkingLot.where(["district_id = ?", district_id])
    else
      ParkingLot.all
    end
  end
  
  #select concat(opening_time,'-',closing_time) from parking_lots;

    
  
end
