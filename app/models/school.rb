#app/models/school.rb

class School < ApplicationRecord
  has_many :students
end
