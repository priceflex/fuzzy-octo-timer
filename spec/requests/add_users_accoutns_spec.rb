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
  it "should be able to create a user"

end
