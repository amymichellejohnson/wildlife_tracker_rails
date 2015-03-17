class AddImageToSpecies < ActiveRecord::Migration
  def change
    add_column :species, :image, :string
  end
end
