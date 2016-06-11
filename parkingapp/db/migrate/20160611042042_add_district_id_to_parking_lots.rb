class AddDistrictIdToParkingLots < ActiveRecord::Migration
  def change
    add_reference :parking_lots, :district, index: true, foreign_key: true
  end
end
