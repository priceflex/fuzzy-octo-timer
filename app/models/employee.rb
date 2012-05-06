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

class Employee < ActiveRecord::Base
  #attr_accessor :password, :password_conformation
  attr_accessible :username, :password, :password_confirmation, :times_attributes
  has_many :times, :class_name => Times
  has_secure_password
  validates_presence_of :password, :on => :create
  validates_uniqueness_of :username
end
