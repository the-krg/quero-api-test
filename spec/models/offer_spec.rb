require 'rails_helper'

describe Offer, type: :model do
  subject { create(:offer) }

  describe 'associations' do
    it { is_expected.to belong_to(:course) }
    it { is_expected.to belong_to(:university) }
    it { is_expected.to belong_to(:campus) }
  end

  # describe 'validations' do
  #   it { should validate_presence_of(:first_name) }
  #   it { should validate_presence_of(:last_name) }
  # end
end