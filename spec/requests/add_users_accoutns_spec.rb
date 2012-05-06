require 'spec_helper'

describe "AddUsersAccoutns" do
  include AuthHelper

  it "should be able to create a user account" do
    employee = Employee.create(:username => "employee1", :password => "secret", :password_confirmation=>  "secret")
    employee.valid?.should == true
    create_employee
    login
    visit employees_path 
    page.should have_content("employee1")
  end

  it "should not be able to access users with out being logged in" do
    visit employees_path 
    page.should have_content("Please login!")
    current_path.should eq(log_in_path)
  end
  it "should be able to create a user" do
    create_employee
    login
    visit employees_path
    click_link "Add Employee"
    fill_in "Username", :with => "testuser"
    fill_in "Password", :with => "secret"
    fill_in "Confirm Password", :with => "secret"
    click_button "Create"
    current_path.should eq(employees_path)
    page.should have_content("testuser")
  end

  it "shoud be able to edit employee" do
    create_employee
    login
    visit employees_path
    click_link "Edit"
    fill_in "Username", :with => "user1"
    click_button "Update"
    current_path.should eq(employees_path)
    page.should have_content("user1")
  end
  it "should not change the password when password is blank" do
    create_employee
    login
    visit employees_path
    click_link "Edit"
    #fill_in "Username", :with => "user1"
    click_button "Update"
    click_link "Log Out"
    login
    page.should have_content("Logged in") 
  end

  #it "should be able to delete eemployee"
end
