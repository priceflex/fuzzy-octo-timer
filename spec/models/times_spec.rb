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

require "spec_helper"

describe Times do
  it "should have attributes clock_in, clock_out, employee_id, project_id, time_decimal, notes"
  it "should belong to employee"
  it "sholud belongs to project"
  it "shoudd be clocked in if clocked out" do
    time = Times.create(:clock_in => Time.now)
    time.clocked_in?.should == true
  end
end
