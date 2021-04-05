class CreateTimeSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :time_schedules do |t|
      t.string :title
      t.string :description
      t.references :distribution_center, null: false, foreign_key: true

      t.timestamps
    end
  end
end
