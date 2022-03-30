#spec/models/school_spec.rb
require 'rails_helper'

RSpec.describe School, type: :model do
  before(:each) do
    @school_1 = School.create!(name: "City High School", census: 200)
    @school_2 = School.create!(name: "City Middle School", census: 97)
    @school_3 = School.create!(name: "City Grade School", census: 104)
    @student_1 = Student.create!(name: "Abraham Adams", gpa: 1.2, freelunch: true, school_id: @school_1.id)
    @student_2 = Student.create!(name: "Bethany Bingham", gpa: 2.3, freelunch: true, school_id: @school_2.id)
    @student_3 = Student.create!(name: "Cher CornCob", gpa: 3.4, freelunch: false, school_id: @school_3.id)
  end

  describe "relationship" do
    it { should have_many :students}
  end

  describe "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :census }
  end
    
end
