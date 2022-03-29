#spec/features/students/index_spec.rb

require 'rails_helper'
# User Story 3, Child Index
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

RSpec.describe 'students index page', type: :feature do
  it 'shows all students w/ attributes' do
    school_1 = School.create!(name: "City High School", census: 200)
    school_2 = School.create!(name: "City Middle School", census: 97)
    school_3 = School.create!(name: "City Grade School", census: 104)
    student_1 = Student.create!(name: "Abraham Adams", gpa: 1.2, freelunch: true, school_id: school_1.id)
    student_2 = Student.create!(name: "Bethany Bingham", gpa: 2.3, freelunch: true, school_id: school_2.id)
    student_3 = Student.create!(name: "Cher CornCob", gpa: 3.4, freelunch: false, school_id: school_3.id)


    visit '/students'


    expect(page).to have_content(student_1.name)
    expect(page).to have_content(student_1.gpa)
    expect(page).to have_content(student_2.name)
    expect(page).to have_content(student_2.gpa)
    expect(page).to have_content(student_3.name)
    expect(page).to have_content(student_3.gpa)

  end
end
