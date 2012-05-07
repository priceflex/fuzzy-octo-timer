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
  validates :project_id, :presence => true
  validates :employee_id, :presence => true

  def clocked_in?
    clock_in != nil && clock_out == nil
  end

  def total_time_decimal
    unless clocked_in?
      return clock_out - clock_in 
    else
      return Time.now - clock_in
    end
  end

  def to_milliseconds
    (total_time_decimal.to_f/3600.to_i).round(2)* 3600000
  end

  def total_time
    total_time_hours_decimal
  end
  def total_time_hours_decimal
    (total_time_decimal.to_f/3600.to_i).round(2)
  end

  def total_time_display
    Time.at(total_time_decimal).gmtime.strftime('%R:%S')
  end

end

