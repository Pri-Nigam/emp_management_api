require 'rails_helper'

RSpec.describe Designation, type: :model do
  let(:designation) {build(:designation)}

  describe 'associations' do
    it { should belong_to(:department) }
    it { should have_many(:employees) }
  end
end
