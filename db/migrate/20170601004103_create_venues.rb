class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
    	t.column :name, :string, :limit => 32, :null => false
    	t.column :address, :string, :limit => 32, :null => false
    	t.column :city, :string, :limit => 32, :null => false
    	t.column :state, :string, :limit => 2, :null => false
      	t.column :created_at, :timestamp
    end
  end
end
