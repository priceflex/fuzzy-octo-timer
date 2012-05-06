require 'spec_helper'

describe "CreateANewProjects" do
  include AuthHelper
  it "should be able to add a new project" do
    Project.create(:name => "Test Project")
    create_employee
    login
    visit projects_path
    page.should have_content("Test Project")
  end
  it "should be only alloed to access projects when logged in" do
    visit projects_path
    page.should have_content("Please login!")
  end
  it "should be able to create a project" do
    create_employee
    login
    visit projects_path
    click_link "Create New Project"
    fill_in "Name", :with => "Test Project"
    click_button "Create"
    current_path.should eq(projects_path)
    page.should have_content("Successfully created project Test Project")
  end
end
