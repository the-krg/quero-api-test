require 'rails_helper'

describe UniversitiesController, type: :controller do
  let(:university) { create(:university) }

  describe '#index' do
    subject { get :index }

    before { university }

    it 'returns a collection of Universities' do
      body = JSON.parse(subject.body)

      expect(body.first['id']).to eq(university.id)
    end
  end

  describe '#show' do
    subject { get(:show, params: { id: university.id }) }

    before { university }

    it 'returns the created University' do
      body = JSON.parse(subject.body)

      expect(body['name']).to eq(university.name)
    end
  end

  describe '#create' do
    let(:params) {{ university: build(:university).attributes }}
    let(:perform) { post(:create, params: params) }

    it 'returns 201 status' do
      perform

      expect(response.code).to eq(201.to_s)
    end
  end

  describe '#update' do
    let(:old_value) { 'OldName' }
    let(:new_value) { 'NewName' }
    let(:university) { create(:university, name: old_value) }
    let(:params) do
      attributes = university.attributes
      attributes['name'] = new_value

      attributes
    end
    let(:perform) { patch(:update, params: { id: university.id, university: params }) }

    it 'changes University value' do
      expect { perform }.to change {
        University.find(university.id).name
      }.from(old_value).to(new_value)
    end
  end

  describe '#destroy' do
    let(:university) { create(:university) }
    let(:perform) { delete(:destroy, params: { id: university.id }) }

    it 'destroy the record' do
      expect { perform }.to change {
        University.find_by_id(university.id)
      }.from(University).to(nil)
    end
  end
end