#spec/features/students/index_spec.rb

require 'rails_helper'
# User Story 3, Child Index
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes:

RSpec.describe 'students index page', type: :feature do
  before(:each) do
    @school_2 = School.create!(name: "City High School", census: 200)
    @school_1 = School.create!(name: "City Middle School", census: 97)
    @school_3 = School.create!(name: "City Grade School", census: 104)
    @student_1 = Student.create!(name: "Abraham Adams", gpa: 1.2, freelunch: true,school_id: @school_1.id)
    @student_11 = Student.create!(name: "Alicia Arden", gpa: 4.0, freelunch: false, school_id: @school_1.id)
    @student_2 = Student.create!(name: "Bethany Bingham", gpa: 2.3, freelunch: false, school_id: @school_2.id)
    @student_22 = Student.create!(name: "Bert Bond", gpa: 2.0, freelunch: true, school_id: @school_2.id)
    @student_3 = Student.create!(name: "Cher CornCob", gpa: 3.4, freelunch: false, school_id: @school_3.id)
    @student_33 = Student.create!(name: "Carl Cobert", gpa: 2.7, freelunch: true, school_id: @school_3.id)

    visit '/students'
  end

  it 'shows all students w/ attributes' do

    expect(page).to have_content(@student_1.name)
    expect(page).to have_content(@student_1.gpa)
    expect(page).to have_content(@student_2.name)
    expect(page).to have_content(@student_2.gpa)
    expect(page).to have_content(@student_3.name)
    expect(page).to have_content(@student_3.gpa)
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



  it 'has links to delete student' do
save_and_open_page
    expect(page).to have_button("Delete #{@student_1.name}")

    click_button("Delete #{@student_1.name}")
    expect(current_path).to eq("/students")
    expect(page).to_not have_content(@student_1.name)
  end
end
