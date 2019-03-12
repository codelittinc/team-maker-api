require 'rails_helper'

RSpec.describe ScheduleTypesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:schedule_type)

      get :index
    end

    let(:schedule_types) { ScheduleType.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys'do
      body_as_json.each { |schedule_type| expect(schedule_type.keys).to match_array(%w[id name]) }
    end

    it { expect(body_as_json).to match(schedule_types.as_json) }
  end

  describe 'GET #show/:id' do
    let(:schedule_type) { create(:schedule_type) }

    let(:reference_hash) do
      { id: schedule_type.id,
        name: schedule_type.name }
    end

    before do
      get :show, params: { id: schedule_type.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'GET #create' do
    let(:schedule_type) { attributes_for(:schedule_type) }

    let(:reference_hash) do
      { id: ScheduleType.last.id,
        name: ScheduleType.last.name }
    end

    before do
      get :create, params: { schedule_type: schedule_type }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id name]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end
end
