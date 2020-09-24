require 'rails_helper'

describe Course, type: :model do
  subject { create(:course) }

  describe 'associations' do
    it { is_expected.to belong_to(:university) }
    it { is_expected.to belong_to(:campus) }
    it { is_expected.to have_many(:offers) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:first_name) }
  #   it { should validate_presence_of(:last_name) }
  # end
end