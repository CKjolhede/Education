#app/models/school.rb

class School < ApplicationRecord
  has_many :students

  validates_presence_of :name
  validates_presence_of :census

  def self.in_order
    School.order(created_at: :asc)
  end

end
