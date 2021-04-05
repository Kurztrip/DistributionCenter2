class CreateDistributionCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :distribution_centers do |t|
      t.string :address
      t.float :latitude_location
      t.float :longitude_location
      t.float :total_space
      t.float :available_space

      t.timestamps
    end
  end
end
