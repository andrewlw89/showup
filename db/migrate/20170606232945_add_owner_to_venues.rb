class AddOwnerToVenues < ActiveRecord::Migration[5.1]
  def change
  	add_reference :venues, :owner, index: true
  	add_foreign_key :venues, :owners
  end
end
