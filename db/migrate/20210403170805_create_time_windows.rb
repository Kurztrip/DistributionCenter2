class CreateTimeWindows < ActiveRecord::Migration[6.1]
  def change
    create_table :time_windows do |t|
      t.datetime :beginning
      t.datetime :ending
      t.references :time_schedule, null: false, foreign_key: true

      t.timestamps
    end
  end
end
