class AddParkingLotIdToRents < ActiveRecord::Migration
  def change
    add_reference :rents, :parking_lot, index: true, foreign_key: true
  end
end
