class AddNotesToTimes < ActiveRecord::Migration
  def change
    add_column :times, :notes, :text
  end
end
