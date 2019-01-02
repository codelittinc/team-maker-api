require 'rails_helper'

RSpec.describe SchedulesController, type: :controller do
  describe 'GET #index' do
    before do
      create(:schedule)

      get :index
    end

    let(:schedules) { Schedule.all }

    it { expect(response.body).to look_like_json }

    it 'Every object on response should have the own attributes as keys' do
      body_as_json.each { |schedule| expect(schedule.keys).to match_array(%w[id project_id resource_id schedule_type_id]) }
    end

    it { expect(body_as_json).to match(schedules.as_json) }
  end

  describe 'GET #show/:id' do
    let(:schedule) { create(:schedule) }

    let(:reference_hash) do
      { id: schedule.id,
        project_id: schedule.project_id,
        resource_id: schedule.resource_id,
        schedule_type_id: schedule.schedule_type_id }
    end

    before do
      get :show, params: { id: schedule.id }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id project_id resource_id schedule_type_id]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end
end
