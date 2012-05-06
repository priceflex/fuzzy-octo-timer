require 'spec_helper'

describe "Navagate" do
  include AuthHelper

  it "to log out" do
    create_employee
    login
    visit timer_path 
    click_link "Log Out"
    current_path.should eq(log_in_path)
    page.should have_content("You are now logged out!")
  end
  it "to projects" do
    create_employee
    login
    visit timer_path
    click_link "Projects"
    current_path.should eq(projects_path)
  end
  it "to employees" do
    create_employee
    login
    visit timer_path
    click_link "Employees"
    current_path.should eq(employees_path)
  end
  it "to timer" do
    create_employee
    login
    visit timer_path
    click_link "Home"
    current_path.should eq(timer_path)
  end
end
