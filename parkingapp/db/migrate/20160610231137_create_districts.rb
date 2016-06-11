class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :description
      t.string :photo
    end
  end
end
