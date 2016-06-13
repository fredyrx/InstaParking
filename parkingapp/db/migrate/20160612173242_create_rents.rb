class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      #t.references :user, foreign_key: true
      #t.references :parking_lot, foreign_key: true
      t.date :date
      t.time :start_time
      t.time :end_time
      t.integer :total_minutes
      t.float :total_time   
      t.float :total_price

      t.timestamps  null: false
    end
  end
end
