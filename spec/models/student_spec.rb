require 'rails_helper'

RSpec.describe Student, type: :model do
  describe "relationships" do
    it {should belong_to :school}
  end

  describe "validation" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :gpa }
  end

end
