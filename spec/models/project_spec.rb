# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require "spec_helper"

describe Project do
  it { should have_db_column(:name) }
  it "should have total_time" do
    clock_in = Time.new(2010,01,01,15,22,0,"-08:00")
    clock_out = Time.new(2010,01,01,15,44,0,"-08:00")
    Employee.create(:username => "user", :password => "secret", :password_confirmation => "secret")
    project = Project.create(:name => "Test Project")
    Times.create(:clock_in => clock_in, :clock_out => clock_out, :project_id => Project.first, :employee_id => Employee.first)
    Times.create(:clock_in => clock_in, :clock_out => clock_out, :project_id => Project.first, :employee_id => Employee.first)
    project.total_time.should == 0.74
  end
end
