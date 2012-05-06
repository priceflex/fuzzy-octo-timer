# == Schema Information
#
# Table name: times
#
#  id           :integer         not null, primary key
#  clock_in     :datetime
#  clock_out    :datetime
#  time_decimal :decimal(, )
#  employee_id  :integer
#  project_id   :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#  notes        :text
#

class Times < ActiveRecord::Base
  attr_accessible :clock_in, :clock_out, :employee_id, :project_id, :time_decimal, :notes
  belongs_to :employee
  belongs_to :project
  
  def clocked_in?
    clock_in != nil && clock_out == nil
  end

end

