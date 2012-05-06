require 'spec_helper'

describe "TracktimeOnProjects" do
  include AuthHelper
  it "should be able to track time on project" do
    Project.create(:name => "Test Project")
    create_employee
    login
    visit timer_path
    page.has_no_button?("Stop").should == true
    select "Test Project", :from => "Project"
    fill_in "Notes", :with => "Starting Project"
    click_button "Start"
    page.should have_content("Started Test Project")
    current_path.should eq(timer_path)
    page.has_no_button?("Start").should == true
    click_button "Stop"
    page.should have_content("Stopped Time on Test Project")
    current_path.should eq(timer_path)
    
  end
  it "should keep record of active clock on employee" do
    Project.create(:name => "Test Project")
    create_employee
    login
    visit timer_path
    select "Test Project", :form => "Project"
    click_button "Start"
    click_link "Log Out"
    login
    page.has_button?("Start").should == false
  end
  it "should be able to edit notes and time when project is loaded"
end
