require 'rails_helper'

describe OffersController, type: :controller do
  let(:offer) { create(:offer) }

  describe '#index' do
    subject { get :index }

    context 'with blank parameters' do
      before { offer }

      it 'returns a collection of Offers' do
        body = JSON.parse(subject.body)

        expect(body.first['id']).to eq(offer.id)
      end
    end

    context 'when ordering by price_with_discount' do
      subject { get(:index, params: { order: order }) }

      let!(:smaller) { create(:offer, price_with_discount: 1.0) }
      let!(:bigger) { create(:offer, price_with_discount: 100.0) }

      context 'ordering ASC' do
        let(:order) { 'asc' }

        it 'returns the smaller record first' do
          body = JSON.parse(subject.body)

          expect(body.first['id']).to eq(smaller.id)
        end
      end

      context 'ordering DESC' do
        let(:order) { 'desc' }

        it 'returns the bigger record first' do
          body = JSON.parse(subject.body)

          expect(body.first['id']).to eq(bigger.id)
        end
      end
    end

    context 'when filtering' do
      context 'by course' do
        let(:correct_course_name) { 'Foo' }
        let(:incorrect_course_name) { 'Bar' }
        let(:course) { create(:course, name: correct_course_name) }
        let(:other_course) { create(:course, name: incorrect_course_name) }
        let!(:offer) { create(:offer, course: course) }
        let!(:incorrect_offer) { create(:offer, course: other_course) }

        subject { get(:index, params: { course_name: correct_course_name }) }

        it 'returns only the Offer with the course' do
          body = JSON.parse(subject.body)

          expect(body.pluck('course_id')).to include(course.id)
        end

        it 'does not return the incorrect course' do
          body = JSON.parse(subject.body)

          expect(body.pluck('course_id')).to_not include(other_course.id)
        end
      end
    end
  end

  describe '#show' do
    subject { get(:show, params: { id: offer.id }) }
    let(:desired_attributes) { %w(full_price discount_percentage start_date enrollment_semester enabled course university campus) }
    let(:undesired_attributes) { %w(created_at updated_at id) }

    before { offer }

    it 'returns the created Offer' do
      body = JSON.parse(subject.body)

      expect(body['full_price']).to eq(offer.full_price)
    end

    it 'brings the desired attributes defined on OfferSerializer' do
      body = JSON.parse(subject.body)

      expect(body.keys).to match_array(desired_attributes)
    end

    it 'does not bring the undesired attributes' do
      body = JSON.parse(subject.body)

      expect(body.keys).to_not match_array(undesired_attributes)
    end
  end

  describe '#create' do
    let(:params) {{ offer: build(:offer).attributes }}
    let(:perform) { post(:create, params: params) }

    it 'returns 201 status' do
      perform

      expect(response.code).to eq(201.to_s)
    end
  end

  describe '#update' do
    let(:old_value) { 543.21 }
    let(:new_value) { 123.45 }
    let(:offer) { create(:offer, full_price: old_value) }
    let(:params) do
      attributes = offer.attributes
      attributes['full_price'] = new_value

      attributes
    end
    let(:perform) { patch(:update, params: { id: offer.id, offer: params }) }

    it 'changes Offer value' do
      expect { perform }.to change {
        Offer.find(offer.id).full_price
      }.from(old_value).to(new_value)
    end
  end

  describe '#destroy' do
    let(:offer) { create(:offer) }
    let(:perform) { delete(:destroy, params: { id: offer.id }) }

    it 'destroy the record' do
      expect { perform }.to change {
        Offer.find_by_id(offer.id)
      }.from(Offer).to(nil)
    end
  end
end