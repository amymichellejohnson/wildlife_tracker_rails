class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.column :date, :date
      t.column :longitude, :integer
      t.column :latitude, :integer
      t.column :species_id, :integer
      t.timestamps
    end
  end
end
