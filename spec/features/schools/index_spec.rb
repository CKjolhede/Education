#spec/features/schools/index_spec.rb
require 'rails_helper'

RSpec.describe 'schools index page', type: :feature do
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

        visit '/schools'
  end

  it 'shows all schools' do

    expect(page).to have_content(@school_1.name)
    expect(page).to have_content(@school_1.census)
    expect(page).to have_content(@school_2.name)
    expect(page).to have_content(@school_2.census)
    expect(page).to have_content(@school_3.name)
    expect(page).to have_content(@school_3.census)
  end

  it 'shows all schools in order of creation' do

  expect(@school_1.name).to appear_before(@school_2.name)
  expect(@school_3.name).to appear_before(@school_1.name)
  expect(page).to have_content(@school_1.created_at)
  expect(page).to have_content(@school_2.created_at)
  expect(page).to have_content(@school_3.created_at)
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

  it 'has links to delete schools' do
    expect(page).to have_button("Delete #{@school_1.name}")
    click_button("Delete #{@school_1.name}")
    expect(current_path).to eq("/schools")
    expect(page).to_not have_content(@school_1.name)
  end


end
