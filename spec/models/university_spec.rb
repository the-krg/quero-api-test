require 'rails_helper'

describe University, type: :model do
  subject { create(:university) }

  describe 'associations' do
    it { is_expected.to have_many(:courses) }
    it { is_expected.to have_many(:campuses) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:first_name) }
  #   it { should validate_presence_of(:last_name) }
  # end
end