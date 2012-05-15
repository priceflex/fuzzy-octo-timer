require 'spec_helper'

describe "Add details about project" do
  include AuthHelper
  it "should store a due date" do 
    project = Project.create(:name => "Test Project", :due_date_string => "05/13/2012")
    create_employee
    login
    visit projects_path
    click_link "Show Details"
    current_path.should eq(project_path(project))
    page.should have_content("Project Due Date")
    find_field("project_due_date_string").value.should == "05/13/2012"
    fill_in "project_due_date_string", :with => "05/26/2013"
    click_button "Update"
    find_field("project_due_date_string").value.should == "05/26/2013"
    current_path.should eq(project_path(project))
    page.should have_content("Successfully update the project info")
  end
  it "should allow you to enter a git url" do
    project = Project.create(:name => "Test Project", :due_date_string => "05/13/2012", :git_repo => "ssh://git@git.stonegiantlabs.com:404/blar.git")
    create_employee
    login
    visit projects_path
    click_link "Show Details"
    find_field("project_git_repo").value.should == project.git_repo
  end
  it "should allow you to specify a git branch" do
    project = Project.create(:name => "Test Project", :due_date_string => "05/13/2012", :description => "This is a description", :git_master_branch => "master")
    create_employee
    login
    visit projects_path
    click_link "Show Details"
    find_field("project_git_master_branch").value.strip.should == project.git_master_branch
  end
  it "should allow you to enter a description about the project" do
    project = Project.create(:name => "Test Project", :due_date_string => "05/13/2012", :description => "This is a description")
    create_employee
    login
    visit projects_path
    click_link "Show Details"
    find_field("project_description").value.strip.should == project.description
  end
  it "should display hours left for project" do
    project = Project.create(:name => "Test Project", :due_date => 1.week.from_now, :description => "This is a description")
    create_employee
    login
    visit projects_path
    click_link "Show Details"
    page.should have_content("Time Left:")
  end
  it "should show tasks from base camp"
end
