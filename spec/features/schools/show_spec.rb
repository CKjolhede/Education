#spec/features/schools/show_spec.rb
require 'rails_helper'

RSpec.describe 'schools show page', type: :feature do
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

    visit "/schools/#{@school_1.id}"
  end

  it 'shows attributes of a school' do

    expect(page).to have_content(@school_1.name)
    expect(page).to have_content(@school_1.census)
    expect(page).to_not have_content(@school_2.name)
    expect(page).to_not have_content(@school_2.census)
    expect(page).to_not have_content(@school_3.name)
  
  end
  it 'shows number of enrolled students' do

    expect(page).to have_content(@school_1.students.count)
  end

  it 'has a link at the top to the student index' do
    click_link "Students"

    expect(page).to have_link("Students", :href=>"/students")
    expect(page).to have_current_path("/students")
  end

  it 'has a link at the top to the school index' do
    click_link "Schools"

    expect(page).to have_link("Schools", :href=>"/schools")
    expect(page).to have_current_path("/schools")
  end

  it 'has a link at the top to this schools student index' do

    expect(page).to have_link("#{@school_1.name} Students", :href=>"/schools/#{@school_1.id}/students")

    click_link "#{@school_1.name} Students"

    expect(page).to have_current_path("/schools/#{@school_1.id}/students")
  end

end
