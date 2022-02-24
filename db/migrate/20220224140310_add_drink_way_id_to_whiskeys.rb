class AddDrinkWayIdToWhiskeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :whiskeys, :drink_way, foreign_key:true
  end
end
