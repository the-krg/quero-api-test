require 'rails_helper'

describe CoursesController, type: :controller do
  let(:course) { create(:course) }

  describe '#index' do
    subject { get :index }

    before { course }

    it 'returns a collection of Courses' do
      body = JSON.parse(subject.body)

      expect(body.first['id']).to eq(course.id)
    end
  end

  describe '#show' do
    subject { get(:show, params: { id: course.id }) }
    let(:desired_attributes) { %w(name kind level shift campus university) }
    let(:undesired_attributes) { %w(created_at updated_at id) }

    before { course }

    it 'returns the created Course' do
      body = JSON.parse(subject.body)

      expect(body['name']).to eq(course.name)
    end

    it 'brings the desired attributes defined on CourseSerializer' do
      body = JSON.parse(subject.body)

      expect(body.keys).to match_array(desired_attributes)
    end

    it 'does not bring the undesired attributes' do
      body = JSON.parse(subject.body)

      expect(body.keys).to_not match_array(undesired_attributes)
    end
  end

  describe '#create' do
    let(:params) {{ course: build(:course).attributes }}
    let(:perform) { post(:create, params: params) }

    it 'returns 201 status' do
      perform

      expect(response.code).to eq(201.to_s)
    end
  end

  describe '#update' do
    let(:old_value) { 'Day' }
    let(:new_value) { 'Night' }
    let(:course) { create(:course, shift: old_value) }
    let(:params) do
      attributes = course.attributes
      attributes['shift'] = new_value

      attributes
    end
    let(:perform) { patch(:update, params: { id: course.id, course: params }) }

    it 'changes Course value' do
      expect { perform }.to change {
        Course.find(course.id).shift
      }.from(old_value).to(new_value)
    end
  end

  describe '#destroy' do
    let(:course) { create(:course) }
    let(:perform) { delete(:destroy, params: { id: course.id }) }

    it 'destroy the record' do
      expect { perform }.to change {
        Course.find_by_id(course.id)
      }.from(Course).to(nil)
    end
  end
end