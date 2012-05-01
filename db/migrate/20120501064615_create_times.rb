class CreateTimes < ActiveRecord::Migration
  def change
    create_table :times do |t|
      t.datetime :clock_in
      t.datetime :clock_out
      t.decimal :time_decimal
      t.integer :employee_id
      t.integer :project_id

      t.timestamps
    end
  end
end
