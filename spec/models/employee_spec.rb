# == Schema Information
#
# Table name: employees
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

require "spec_helper"

describe Employee do
  it "should have username"
  it "should not have password_digest mass assinable"
  it "should have_many times"
end
