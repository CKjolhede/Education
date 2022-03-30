# spec/features/students/new_spec.rb

require 'rails_helper'

RSpec.describe 'when I visit a Parent Child Index page' do
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

    visit "/schools/#{@school_2.id}/students"
  end

  it 'has link to create new student' do

    click_button("Create Student")
    expect(current_path).to eq("/schools/#{@school_2.id}/students/new")
  end

  it 'can create a new student' do
    visit "/schools/#{@school_2.id}/students/new"

    fill_in('Name', with: 'Newlin Newton')
    fill_in('gpa', with: 4.2)
    fill_in('freelunch', with: false)
    click_button('Create Student')

    expect(current_path).to eq("/schools/#{@school_2.id}/students")
    expect(page).to have_content("Newlin Newton")
  end
end
