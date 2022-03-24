#spec/features/index_spec.rb
require 'rails_helper'
# User Story 1, Parent Index
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

RSpec.describe 'schools index page', type: :feature do
  it 'shows all schools' do
    school_1 = School.create!(name: "City High School", census: 200)
    school_2 = School.create!(name: "City Middle School", census: 97)
    school_3 = School.create!(name: "City Grade School", census: 104)

    visit '/schools'

    expect(page).to have_content(school_1.name)
    expect(page).to have_content(school_1.census)
    expect(page).to have_content(school_2.name)
    expect(page).to have_content(school_2.census)
    expect(page).to have_content(school_3.name)
    expect(page).to have_content(school_3.census)

  end
end
