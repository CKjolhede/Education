require "rails_helper"

# User Story 11, Parent Creation
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.

RSpec.describe 'Creating a new School' do
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

  it 'links to the new school creation page from the artists index' do
    visit '/schools'

    click_link('New School')
    expect(current_path).to eq('/schools/new.html.erb')
  end

  it 'can create a new school' do
    visit '/schools/new.html.erb'

    fill_in('Name', with: 'New Academy')
    fill_in('Census', with: '300')

    click_button('Create School')
    new_school_id = School.last.id
    expect(current_path).to eq("/schools/#{new_school_id}")
  end
end
