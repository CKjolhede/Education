# spec/features/schools/students/index_spec.rb

# User Story 5, Parent Children Index
#
# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes:
require 'rails_helper'

RSpec.describe "School student index" do
  it 'only shows all students enrolled in a school and their attributes' do
    school_1 = School.create!(name: "City High School", census: 200)
    school_2 = School.create!(name: "City Middle School", census: 97)
    school_3 = School.create!(name: "City Grade School", census: 104)
    student_1 = Student.create!(name: "Abraham Adams", gpa: 1.2, freelunch: true,school_id: school_1.id)
    student_11 = Student.create!(name: "Alicia Arden", gpa: 4.0, freelunch: false, school_id: school_1.id)
    student_2 = Student.create!(name: "Bethany Bingham", gpa: 2.3, freelunch: false, school_id: school_2.id)
    student_22 = Student.create!(name: "Bert Bond", gpa: 2.0, freelunch: true, school_id: school_2.id)
    student_3 = Student.create!(name: "Cher CornCob", gpa: 3.4, freelunch: false, school_id: school_3.id)
    student_33 = Student.create!(name: "Carl Cobert", gpa: 2.7, freelunch: true, school_id: school_3.id)

  visit "/schools/#{school_1.id}/students"

  expect(page).to have_content(student_1.name)
  expect(page).to have_content(student_1.gpa)
  expect(page).to have_content(student_1.freelunch)
  expect(page).to have_content(student_11.name)
  expect(page).to have_content(student_11.gpa)
  expect(page).to have_content(student_11.freelunch)
  expect(page).to_not have_content(student_2.name)
  expect(page).to_not have_content(student_3.name)
  end
end
