require 'rails_helper'

RSpec.describe Department, type: :model do
  let(:department) {build(:department)}

  describe 'associations' do
    it { should have_many(:designations) }
    it { should have_many(:employees) }
  end
end
