class AddOwnerToVenues < ActiveRecord::Migration[5.1]
  def change
  	add_foreign_key :venues, :owners
  end
end
