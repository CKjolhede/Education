#app/models/student.rb

class Student < ApplicationRecord
  belongs_to :school

  validates_presence_of [:name]
  validates_presence_of [:gpa]
  validates :freelunch, inclusion: [true, false]
  validates :freelunch, exclusion: [nil]

end
