class AddSnackIdToWhiskeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :whiskeys, :snack, foreign_key:true
  end
end
