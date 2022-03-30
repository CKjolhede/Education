#spec/features/students/show_spec.rb

require 'rails_helper'


# User Story 4, Child Show
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes:

RSpec.describe 'students show page', type: :feature do
  before(:each) do
    @school_1 = School.create!(name: "City High School", census: 200)
    @school_2 = School.create!(name: "City Middle School", census: 97)
    @school_3 = School.create!(name: "City Grade School", census: 104)
    @student_1 = Student.create!(name: "Abraham Adams", gpa: 1.2, freelunch: true,school_id: @school_1.id)
    @student_11 = Student.create!(name: "Alicia Arden", gpa: 4.0, freelunch: false, school_id: @school_1.id)
    @student_2 = Student.create!(name: "Bethany Bingham", gpa: 2.3, freelunch: false, school_id: @school_2.id)
    @student_22 = Student.create!(name: "Bert Bond", gpa: 2.0, freelunch: true, school_id: @school_2.id)
    @student_3 = Student.create!(name: "Cher CornCob", gpa: 3.4, freelunch: false, school_id: @school_3.id)
    @student_33 = Student.create!(name: "Carl Cobert", gpa: 2.7, freelunch: true, school_id: @school_3.id)

    visit "/students/#{@student_1.id}"
  end

  it 'shows all attributes of a student' do

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.freelunch)
    expect(page).to_not have_content(@student_2.name)
    expect(page).to_not have_content(@student_3.name)
  end

  it 'has a link at the top to the student index' do
    click_link "Students"

    expect(page).to have_link("Students", :href=>"/students")
    expect(page).to have_current_path("/students")
  end

  it 'has a link at the top to the student index' do
    click_link "Schools"

    expect(page).to have_link("Schools", :href=>"/schools")
    expect(page).to have_current_path("/schools")
  end

end
