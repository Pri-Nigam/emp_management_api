require 'rails_helper'

RSpec.describe Employee, type: :model do
  let(:employee) {build(:employee)}

  describe 'associations' do
    it { should belong_to(:designation) }
  end
end
