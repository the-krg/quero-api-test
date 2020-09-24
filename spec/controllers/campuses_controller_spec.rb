require 'rails_helper'

describe CampusesController, type: :controller do
  let(:campus) { create(:campus) }

  describe '#index' do
    subject { get :index }

    before { campus }

    it 'returns a collection of Campuses' do
      body = JSON.parse(subject.body)

      expect(body.first['id']).to eq(campus.id)
    end
  end

  describe '#show' do
    subject { get(:show, params: { id: campus.id }) }

    before { campus }

    it 'returns the created Campus' do
      body = JSON.parse(subject.body)

      expect(body['name']).to eq(campus.name)
    end
  end

  describe '#create' do
    let(:params) {{ campus: build(:campus).attributes }}
    let(:perform) { post(:create, params: params) }

    it 'returns 201 status' do
      perform

      expect(response.code).to eq(201.to_s)
    end
  end

  describe '#update' do
    let(:old_value) { 'OldName' }
    let(:new_value) { 'NewName' }
    let(:campus) { create(:campus, name: old_value) }
    let(:params) do
      attributes = campus.attributes
      attributes['name'] = new_value

      attributes
    end
    let(:perform) { patch(:update, params: { id: campus.id, campus: params }) }

    it 'changes Campus value' do
      expect { perform }.to change {
        Campus.find(campus.id).name
      }.from(old_value).to(new_value)
    end
  end

  describe '#destroy' do
    let(:campus) { create(:campus) }
    let(:perform) { delete(:destroy, params: { id: campus.id }) }

    it 'destroy the record' do
      expect { perform }.to change {
        Campus.find_by_id(campus.id)
      }.from(Campus).to(nil)
    end
  end
end