class Employee < ActiveRecord::Base
  attr_accessible :password_digest, :username
  has_many :times
end
