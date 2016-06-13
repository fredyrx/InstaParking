class AddUserIdToRents < ActiveRecord::Migration
  def change
    add_reference :rents, :user, index: true, foreign_key: true
  end
end
