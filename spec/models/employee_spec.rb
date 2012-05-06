# == Schema Information
#
# Table name: employees
#
#  id               :integer         not null, primary key
#  username         :string(255)
#  password_digest  :string(255)
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#  current_timer_id :integer
#

require "spec_helper"

describe Employee do
  include AuthHelper
  it { should have_db_column(:username).of_type(:string) }
  it { should have_db_column(:password_digest).of_type(:string) }
  it { should_not allow_mass_assignment_of(:password_digest) }
  it { should have_many(:times) }
  it { should have_db_column(:current_timer_id) }
  it "should only have uniq usernames" do 
    create_employee 
    create_employee
    Employee.all.size.should == 1
  end
end
