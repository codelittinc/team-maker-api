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
end
