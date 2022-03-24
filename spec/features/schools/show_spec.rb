#spec/features/schools/show_spec.rb

require 'rails_helper'


# User Story 2, Parent Show
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes:
# - data from each column that is on the parent table

RSpec.describe 'schools show page', type: :feature do
  it 'shows attributes of a school' do
    school_1 = School.create!(name: "City High School", census: 200)
    school_2 = School.create!(name: "City Middle School", census: 97)
    school_3 = School.create!(name: "City Grade School", census: 104)

    visit "/schools/#{school_1.id}"

    expect(page).to have_content(school_1.name)
    expect(page).to have_content(school_1.census)
    expect(page).to not_have_content(school_2.name)
    expect(page).to not_have_content(school_2.census)
    expect(page).to not_have_content(school_3.name)
    expect(page).to not_have_content(school_3.census)

  end
end
