class AddCurrentProjectIdToProject < ActiveRecord::Migration
  def change
    add_column :employees, :current_timer_id, :integer
  end
end
