require 'spec_helper'

describe "ShowProjectsDetails" do
  include AuthHelper
  it "should be able to show clock ins of a project" do
    project = Project.create(:name => "Test Project")
    create_employee
    Times.create(:clock_in => Time.now, :clock_out => Time.now, :notes => "Worked on project", :employee_id => Employee.first.id, :project_id => Project.first.id)

    login
    visit projects_path
    click_link "Show Details"
    page.should have_content("Worked on project")
    current_path.should eq(project_path(project))
  end
end
