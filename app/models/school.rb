#app/models/school.rb

class School < ApplicationRecord
  has_many :students

  validates_presence_of :name
  validates_presence_of :census
  
  def order
  end

end
