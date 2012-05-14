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
  attr_accessible :name, :total_time, :times_attributes, :due_date_string, :due_date, :git_repo, :description
  attr_reader :due_date_string

  has_many :times, :class_name => Times

  def my_time(employee)
    times.where(:employee_id => employee.id).map(&:total_time).sum.round(2)
  end 
  def total_time
    times.map(&:total_time).sum.round(2)
  end

  def due_date_string=(date)
    self.due_date = Chronic.parse(date.to_s)
  end
  def due_date_string
    self.due_date.strftime("%m/%d/%Y") if self.due_date
  end
  def due_date
    if super
      return super
    else
      return Time.now
    end
  end
end
