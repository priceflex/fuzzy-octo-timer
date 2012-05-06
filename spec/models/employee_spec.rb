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
  it { should have_db_column(:username).of_type(:string) }
  it { should have_db_column(:password_digest).of_type(:string) }
  it { should_not allow_mass_assignment_of(:password_digest) }
  it { should have_many(:times) }
end
