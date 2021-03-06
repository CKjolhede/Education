require 'rails_helper'

RSpec.describe "School Edit", method: :feature do
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
  end

  it 'link in show to the school edit page' do
    visit "/schools/#{@school_1.id}"

    click_button "Edit #{@school_1.name}"

    expect(current_path).to eq("/schools/#{@school_1.id}/edit")
  end

  it 'has link on school index to the school edit page' do
    visit "/schools"

    click_button "Edit #{@school_1.name}"

    expect(current_path).to eq("/schools/#{@school_1.id}/edit")
  end

  it 'can edit school info' do
    visit "/schools/#{@school_1.id}/edit"

    fill_in "name", with: "Empower Middle School"
    fill_in "census", with: 76125
    click_button "Update School"
    expect(current_path).to eq("/schools/#{@school_1.id}")
    expect(page).to have_content("Empower Middle School" && 76125)
  end
end
