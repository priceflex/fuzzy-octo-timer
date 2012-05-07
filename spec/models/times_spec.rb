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
  describe "should have attributes clock_in, clock_out, employee_id, project_id, time_decimal, notes" do
    it { should have_db_column(:clock_in).of_type(:datetime) }
    it { should have_db_column(:clock_out).of_type(:datetime) }
    it { should have_db_column(:time_decimal).of_type(:decimal) }
    it { should have_db_column(:employee_id).of_type(:integer) }
    it { should have_db_column(:project_id).of_type(:integer) }
    it { should have_db_column(:notes).of_type(:text) }
    it { should validate_presence_of(:project_id) }
    it { should validate_presence_of(:employee_id) }
  end
  it { belong_to(:employee) }
  it { belong_to(:project) }

  it "shoudd be clocked out if clocked out" do
    time = Times.create(:clock_in => Time.now, :clock_out => Time.now)
    time.clocked_in?.should == false 
  end
  it "shoudd be clocked in if clocked out" do
    time = Times.create(:clock_in => Time.now)
    time.clocked_in?.should == true
  end
  it "should calculate total time in decimal" do
    clock_in = Time.new(2010,01,01,15,22,0,"-08:00")
    clock_out = Time.new(2010,01,01,15,44,0,"-08:00")
    Employee.create(:username => "user", :password => "secret", :password_confirmation => "secret")
    project = Project.create(:name => "Test Project")
    time = Times.create(:clock_in => clock_in, :clock_out => clock_out, :project_id => Project.first, :employee_id => Employee.first)
    time.total_time.should == 0.37
    time.total_time_display.should == "00:22:00"
  end
end
