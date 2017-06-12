class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.string :artist
      t.float :cost
      t.datetime :date
      t.references :venue, foreign_key: true

      t.timestamps
    end
  end
end
