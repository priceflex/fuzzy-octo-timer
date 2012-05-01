class Times < ActiveRecord::Base
  attr_accessible :clock_in, :clock_out, :employee_id, :project_id, :time_decimal
  belongs_to :employee
  belongs_to :project
end
