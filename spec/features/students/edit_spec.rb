require 'rails_helper'

RSpec.describe 'when I visit a student show page' do
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

    visit "/students/#{@student_1.id}"
  end

  it 'has a button that navigates to eidt screen' do
    expect(page).to have_button('Update Student')

    click_link "Update Student"
    expect(current_path).to eq("/students/#{@student.id}/edit")
  end

  it 'can make edits to the student' do
    visit "/students/#{@student_1.id}/edit"

    fill_in "Name", with: "Amy Adams"
    fill_in "gpa", with: 3.3
    fill_in 'freelunch', with: true
    click_button "Update Student"

    expect(current_path).to eq("/students/#{@student_1.id}")
    expect(page).to have_content("Amy Adams")
  end
end
