class CreateParkingLots < ActiveRecord::Migration
  def change
    create_table :parking_lots do |t|
      #t.references :user, foreign_key: true
      #t.references :district, foreign_key: true
      t.string :name
      t.string :description
      t.integer :price
      t.integer :spaces
      t.time :opening_time
      t.time :closing_time
      t.string :photo
      t.integer :slots
      t.boolean :has_security_cameras
      t.boolean :has_security_alarms
      t.boolean :has_security_persons
      t.boolean :has_supermarkets_close
      t.boolean :has_restaurants_close
      t.boolean :has_cinemas_close

      t.timestamps  null: false
    end
  end
end
