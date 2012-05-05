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

class Employee < ActiveRecord::Base
  attr_accessible :password_digest, :username
  has_many :times
end
