#spec/models/school_spec.rb
require 'rails_helper'

RSpec.describe School, type: :model do
  describe "relationship" do
    it { should have_many :students}
  end
end
