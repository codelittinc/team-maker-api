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

  describe 'GET #create' do
    let(:project) { create(:project) }
    let(:resource) { create(:resource) }
    let(:schedule_type) { create(:schedule_type) }
    let(:schedule) do
      attributes_for(:schedule,
                     project_id: project.id,
                     resource_id: resource.id,
                     schedule_type_id: schedule_type.id)
    end

    let(:reference_hash) do
      { id: Schedule.last.id,
        project_id: project.id,
        resource_id: resource.id,
        schedule_type_id: schedule_type.id }
    end

    before do
      get :create, params: { schedule: schedule }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id project_id resource_id schedule_type_id]) }

    it { expect(body_as_json).to match(reference_hash.as_json) }
  end

  describe 'DELETE #destroy' do
    let(:schedule) { create(:schedule) }
    let(:destroy_action) { delete :destroy, params: { id: schedule.id } }

    before do
      schedule
    end

    it { expect { destroy_action }. to change(Schedule, :count).by(-1) }
  end

  describe 'PATCH #update' do
    let(:project) { create(:project) }
    let(:resource) { create(:resource) }
    let(:schedule_type) { create(:schedule_type) }
    let(:schedule) { create(:schedule) }

    let(:schedule_updated) do
      { id: Schedule.last.id,
        project_id: project.id,
        resource_id: resource.id,
        schedule_type_id: schedule_type.id }
    end

    before do
      schedule

      patch :update, params: { id: schedule.id, schedule: schedule_updated }
    end

    it { expect(response.body).to look_like_json }

    it { expect(body_as_json.keys).to match_array(%w[id project_id resource_id schedule_type_id]) }

    it { expect(body_as_json).to match(schedule_updated.as_json) }

    it { expect(body_as_json).to_not match(schedule.as_json) }
  end
end
