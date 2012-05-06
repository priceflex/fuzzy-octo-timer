# == Schema Information
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Project < ActiveRecord::Base
  attr_accessible :name, :total_time, :times_attributes
  has_many :times, :class_name => Times

  def total_time
    times.map(&:total_time).sum
  end
end
