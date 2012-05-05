require 'spec_helper'

describe "AddUsersAccoutns" do
  include AuthHelper
  it "should be able to create a user account" do
    Employee.create(:username => "employee1", :password => "secret", :password_confiromation =>  "secret")
    login
    visit users_path
    page.shoud have_content("employee1")
  end
  it "should not be able to access users with out being logged in" do
    visit users_path
    page.should have_content("Please login!")
    current_path.should eq(sessions_path)
  end

end
