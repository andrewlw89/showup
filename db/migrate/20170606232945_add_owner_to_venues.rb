class AddOwnerToVenues < ActiveRecord::Migration[5.1]
  def change
  	add_reference :venues, :owner
  	add_foreign_key :venues, :owner
  end
end
